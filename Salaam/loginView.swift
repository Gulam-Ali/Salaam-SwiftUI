//
//  loginView.swift
//  Salaam
//
//  Created by Gulam Ali on 03/10/24.
//

import SwiftUI

enum focusedFields{
    case email
    case passwordd
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
                    .lineLimit(2)
                    .foregroundStyle(.black)
                
                Spacer()
                
                emailTextFieldView(email: $email, isValidEmail: $isValidEmail)

               passwordTextFieldView(password: $password, isValidPassword: $isValidPassword, placeholder: "Password")
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
                
       
                appButtonView(destination: registerView(),
                              title: "Login",
                              canTapLogin: canTapLogin)
                
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
    loginView()
}


struct emailTextFieldView: View {
    
    @Binding var email : String
    @Binding var isValidEmail : Bool
    @FocusState var focusedTextField : focusedFields?
    
    var body: some View {
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
                .keyboardType(.emailAddress)
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
    }
}

struct passwordTextFieldView: View {
    
    @Binding var password : String
    @Binding var isValidPassword : Bool
    @FocusState var focusedTextField : focusedFields?
    var placeholder : String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            SecureField(placeholder, text: $password)
                .focused($focusedTextField, equals: .passwordd)
                .padding()
                .background(.secondaryBlue)
                .cornerRadius(12.0)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(!isValidPassword ? .red : focusedTextField == .passwordd ? Color.spotifyIndigo : Color.white, lineWidth: 2)
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
        
    }
}

struct appButtonView<Destination: View>: View {
    
    var destination: Destination
    var title : String = ""
    var canTapLogin : Bool
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
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
    }
}
