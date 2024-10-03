//
//  loginView.swift
//  Salaam
//
//  Created by Gulam Ali on 03/10/24.
//

import SwiftUI

enum focusedFields{
    case email
    case password
}

struct loginView: View {
    
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
                Text("Login here")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(.spotifyIndigo)
                    .padding(.bottom, 12)
                
                Text("Welcome back\n you have been missed!")
                    .font(.system(size: 16, weight: .medium))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.black)
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 4) {
                    // TextField for Email
                    TextField("Email", text: $email)
                        .focused($focusedTextField, equals: .email)
                        .padding()
                        .background(Color.secondaryBlue)
                        .cornerRadius(12.0)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(!isValidEmail ? .red : focusedTextField == .email ? Color.spotifyIndigo : Color.white, lineWidth: 2)
                        )
                        .padding(.horizontal, 25)
                        .onChange(of: email) { oldValue, newValue in
                            isValidEmail = Validator.validateEmail(newValue)
                        }

                    // Label for invalid email
                    if !isValidEmail {
                        Text("Invalid Email")
                            .foregroundColor(.red)
                            .padding(.horizontal, 28) // Matches the padding of TextField
                    }
                }
                
                
                
                VStack(alignment: .leading, spacing: 4) {
                    SecureField("Password", text: $password)
                        .focused($focusedTextField, equals: .password)
                        .padding()
                        .background(.secondaryBlue)
                        .cornerRadius(12.0)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(!isValidPassword ? .red : focusedTextField == .password ? Color.spotifyIndigo : Color.white, lineWidth: 2)
                        )
                        .padding(.horizontal, 25)
                        .onChange(of: password) { oldValue, newValue in
                            isValidPassword = Validator.validatePassword(newValue)
                        }

                    // Label for invalid email
                    if !isValidPassword {
                        Text("Invalid Password")
                            .foregroundColor(.red)
                            .padding(.horizontal, 28) // Matches the padding of TextField
                    }
                }
                .padding(.bottom, 15)
                
                HStack{
                    Spacer()
                    Text("Forgot Password ?")
                        .font(.system(size: 14, weight: .medium))
                        .padding(.horizontal, 25)
                        .onTapGesture {
                            print("forgot password tapped")
                        }
                }
                .padding(.bottom, 25)
                
       
                NavigationLink(destination: registerView()) {
                    Text("Login")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.white)
                }
                .frame(maxWidth: .infinity, minHeight: 60)
                .background(.spotifyIndigo)
                .clipShape(.buttonBorder)
                .shadow(color: .indigo.opacity(0.5), radius: 2, x: 2, y: 2)
                .padding(.horizontal, 25)
                .opacity(canTapLogin ? 1.0 : 0.5)
                .disabled(canTapLogin ? false : true)
                .padding(.bottom, 20)
                
                Text("Create Account")
                    .font(.system(size: 16, weight: .semibold))
                    .padding(.horizontal, 25)
                    .onTapGesture {
                        print("forgot password tapped")
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
              
              bottomView()
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    loginView()
}

struct bottomView: View {
    var body : some View {
        HStack{
            Button(action: {}, label: {
                Image("apple-logo")
                   // .font(.title3)
                    .frame(width: 35, height: 35)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .background(Color.secondaryBlue)
                    .clipShape(Circle())
            })
            Button(action: {}, label: {
                Image("facebook-logo")
                   // .font(.title3)
                    .frame(width: 35, height: 35)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .background(Color.secondaryBlue)
                    .clipShape(Circle())
            })
            Button(action: {}, label: {
                Image("google-logo")
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .background(Color.secondaryBlue)
                    .clipShape(Circle())
                    
            })
        }
        
        .padding()
    }
}
