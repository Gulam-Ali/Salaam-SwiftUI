//
//  appStorage.swift
//  Salaam
//
//  Created by Gulam Ali on 06/10/24.
//

import Foundation
import SwiftUI

enum appStorageKey : String {
    case user
    case isLoggedIn
}

struct loggedUser : Codable {
    let id : String
    let username : String
    let email : String
    let firstName : String
    let accessToken : String
}

class UserStorage: ObservableObject {
    
    // @AppStorage for the encoded user info in JSON format
    @AppStorage(appStorageKey.user.rawValue) private var storedUserData: Data?
    
   var userInfo: loggedUser? {
        didSet {
            saveUserInfo()
        }
    }
    
    // Initialize with existing saved data
    init() {
        if let storedUserData = storedUserData {
            decodeUserInfo(from: storedUserData)
        }
    }
    
    // Function to save user info in AppStorage as encoded data
    private func saveUserInfo() {
        guard let userInfo = userInfo else {
            storedUserData = nil
            return
        }
        
        do {
            let encodedData = try JSONEncoder().encode(userInfo)
            storedUserData = encodedData
        } catch {
            print("Failed to encode user info: \(error)")
        }
    }
    
    // Function to decode the user info from stored data
    private func decodeUserInfo(from data: Data) {
        do {
            let decodedUserInfo = try JSONDecoder().decode(loggedUser.self, from: data)
            self.userInfo = decodedUserInfo
        } catch {
            print("Failed to decode user info: \(error)")
        }
    }
    
    // Clear user data (optional method)
    func clearUserInfo() {
        userInfo = nil
        storedUserData = nil
    }
}

