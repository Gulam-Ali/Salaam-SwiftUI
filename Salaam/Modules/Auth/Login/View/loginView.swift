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
    
    @StateObject private var viewModel = loginVM(manager: networkManager.shared)
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
       // NavigationStack {
            ZStack{
                VStack{
                    Spacer()
                    Spacer(minLength: 100)
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
                    
                    emailTextFieldView(email: $viewModel.email)

                    passwordTextFieldView(password: $viewModel.password, placeholder: "Password")
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
                    
                    Button(action: {
                        hideKeyboard()
                        Task {
                            await viewModel.loginUser()
                        }
                    }, label: {
                        Text("Login")
                            .modifier(StandardButtonStyle())
                    })
                    .padding(.bottom, 20)
                    

                    Text("Create Account")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(.horizontal, 25)
                        .onTapGesture {
                            print("forgot password tapped")
                        }
                        .padding(.bottom, 25)
                
                    
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
                .alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text("Error"), message: Text(viewModel.errorMessage ?? "Unknown error"), dismissButton: .default(Text("OK")))
                }
                if(viewModel.showLoader){
                    loader()
                }
            }
      
        //}
        .toolbar(.hidden, for: .navigationBar)
        .navigationDestination(isPresented: $viewModel.loginSuccess) {
           // navigationPath.append("homeView")
            homeView(navigationPath: $navigationPath)
        }
        
    }
}

#Preview {
    loginView(navigationPath: .constant(NavigationPath()))
}


