//
//  networkManager.swift
//  Salaam
//
//  Created by Gulam Ali on 05/10/24.
//

import Foundation

// Enum to define HTTP methods
enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
    case PATCH
}

// Extension to convert Encodable to dictionary
extension Encodable {
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
        return dictionary ?? [:]
    }
}

protocol networkManagerProtocol {
    func makeRequest<T: Decodable, U: Encodable>(
        urlString: String,
        httpMethod: HTTPMethod,
        body: U?,
        headers: [String: String]?,
        responseType: T.Type
    ) async throws -> T
}

final class networkManager : networkManagerProtocol{
    
    static let shared = networkManager()
    private init() {}
    
    func makeRequest<T: Decodable, U: Encodable>(
        urlString: String,
        httpMethod: HTTPMethod = .GET,
        body: U? = nil,
        headers: [String: String]? = nil,
        responseType: T.Type
    ) async throws -> T {
        
        // 1. Create URL from the string for GET requests (with URLComponents)
        var requestURL: URL?
        
        if httpMethod == .GET, let body = body {
            guard var urlComponents = URLComponents(string: urlString) else {
                throw NetworkError.badURL
            }
            
            // Create query parameters from the body
            let queryItems = try body.asDictionary().map { key, value in
                URLQueryItem(name: key, value: String(describing: value))
            }
            urlComponents.queryItems = queryItems
            requestURL = urlComponents.url
        } else {
            requestURL = URL(string: urlString)
        }
        
        
        guard let url = requestURL else {
            throw NetworkError.badURL
        }
        
        print("🥎 Url ->", url.absoluteString)
        print("🥎 HTTP Method ->", httpMethod.rawValue)
        print("🥎 Body ->", body as Any)
        
        // 2. Create a URLRequest and configure HTTP method, headers, and body
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
            print("🥎 Headers ->",headers)
        }
        
        // Encode the body for POST requests
        if let body = body, httpMethod == .POST {
            request.httpBody = try JSONEncoder().encode(body)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        // 3. Perform the network request with async/await
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // 4. Check for status code and handle 401
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        if httpResponse.statusCode == 401 {
            throw NetworkError.sessionExpired
        }
        
        if  (400...499).contains(httpResponse.statusCode){
            let decodedData = try JSONDecoder().decode(serverErrorModel.self, from: data)
            let message = decodedData.message ?? ""
            throw NetworkError.customError(message)
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.customError("Server returned status code: \(httpResponse.statusCode)")
        }
        
        // 5. Decode the JSON response into the expected type
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
            
        } catch {
            throw NetworkError.decodingError
        }
    }
    

    
}
