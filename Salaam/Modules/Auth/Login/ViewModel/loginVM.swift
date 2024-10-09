//
//  loginVM.swift
//  Salaam
//
//  Created by Gulam Ali on 05/10/24.
//

import Foundation
import SwiftUI

@MainActor
final class loginVM : ObservableObject {
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var errorMessage: String?
    @Published var showAlert: Bool = false
    @Published var loginSuccess: Bool = false
    @Published var showLoader: Bool = false
    
    private var manager : networkManager
    private var userStorage = UserStorage()
    
    init(manager: networkManager) {
        self.manager = manager
    }
    
    private func validateFields() -> Bool{
        //        if !Validator.validateEmail(email){
        //            errorMessage = "Please enter valid email address"
        //            showAlert = true
        //            return false
        //        }
        //        else if !Validator.validatePassword(password){
        //            errorMessage = "Please enter valid password"
        //            showAlert = true
        //            return false
        //        }
        if (email == "" || password == ""){
            errorMessage = "Please enter the required credentials"
            showAlert = true
            return false
        }
        else{
            return true
        }
    }
    
    func loginUser() async{
        if validateFields(){
            showLoader = true
            showAlert = false
            struct LoginRequest: Encodable {
                let username: String
                let password: String
            }
            let requestBody = LoginRequest(username: email, password: password)
            do {
                // Make the network call to login
                let user = try await manager.makeRequest(
                    urlString: apiURL.login,
                    httpMethod: .POST,
                    body: requestBody,
                    responseType: loginModel.self
                )
                userStorage.userInfo = loggedUser(id: "\(user.id ?? 0)", username: user.username ?? "", email: user.email ?? "", firstName: user.firstName ?? "", accessToken: user.accessToken ?? "")
                showLoader = false
                loginSuccess = true
                
            } catch let error as NetworkError {
                // Handle session expiration
                if error == .sessionExpired {
                    errorMessage = "Session has expired. Please log in again."
                } else {
                    errorMessage = error.localizedDescription
                }
                showLoader = false
                showAlert = true // Trigger the alert
            } catch {
                errorMessage = error.localizedDescription
                showLoader = false
                showAlert = true
            }
        }
    }
    
    
}
