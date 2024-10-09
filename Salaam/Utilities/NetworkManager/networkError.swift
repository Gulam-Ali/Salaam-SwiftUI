//
//  networkError.swift
//  Salaam
//
//  Created by Gulam Ali on 05/10/24.
//

import Foundation


enum NetworkError: Error, LocalizedError, Equatable {
    case badURL
    case invalidResponse
    case decodingError
    case sessionExpired
    case unknown
    case customError(String)

    var errorDescription: String? {
        switch self {
        case .badURL:
            return "The URL provided was invalid."
        case .invalidResponse:
            return "The server response was invalid."
        case .decodingError:
            return "Failed to decode the response."
        case .sessionExpired:
            return "Session has expired. Please log in again."
        case .unknown:
            return "An unknown error occurred."
        case .customError(let message):
            return message
        }
    }
}
