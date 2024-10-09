//
//  registerView.swift
//  Salaam
//
//  Created by Gulam Ali on 03/10/24.
//

import SwiftUI

struct registerView: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @FocusState private var focusedTextField : focusedFields?
    @State private var isValidEmail : Bool = true
    @State private var isValidPassword : Bool = true
    private var canTapLogin : Bool {
        Validator.validateEmail(email) && Validator.validatePassword(password)
    }
    
    var body: some View {
        NavigationStack {
            Spacer()
            Spacer(minLength: 100)
            VStack{
                Text("Create Account")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(.spotifyIndigo)
                    .padding(.bottom, 12)
                
                Text("Create an account to find\n new friends on Salaam")
                    .font(.system(size: 16, weight: .medium))
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundStyle(.black)
                
                Spacer()
                
//                emailTextFieldView(email: $email, isValidEmail: $isValidEmail)
//
//                passwordTextFieldView(password: $password, isValidPassword: $isValidPassword, placeholder: "Password")
//                
//                passwordTextFieldView(password: $password, isValidPassword: $isValidPassword, placeholder: "Confirm Password")
//                     .padding(.bottom, 15)

                
//                appButtonView(destination: registerView(),
//                              title: "Create Account",
//                              canTapLogin: canTapLogin)
                
                Text("Already have account")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.horizontal, 25)
                    .onTapGesture {
                        print("")
                    }
                    .padding(.bottom, 25)
                
                Spacer()
                
                HStack{
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.spotifyLightGrey)
                        .padding(.horizontal, 12)
                    Text("Or")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(Color.spotifyLightGrey)
                        
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.spotifyLightGrey)
                        .padding(.horizontal, 12)
                }
                .padding(.horizontal)
              
                socialView {
                    print("apple tapped")
                } facebookTapped: {
                    print("fb tapped")
                } googleTapped: {
                    print("google tapped")
                }

                
                Spacer()
                
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    registerView()
}
