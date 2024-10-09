//
//  loginView.swift
//  Salaam
//
//  Created by Gulam Ali on 29/09/24.
//

import SwiftUI

struct welcomeView: View {
    
    @State private var navigationPath = NavigationPath()
    @State private var showSplashView : Bool = true
    
    var body: some View {
        NavigationStack(path: $navigationPath){
            VStack{
                Spacer()
                Image("work-from-home")
                    .resizable()
                    .scaledToFit()
                    .padding(25)
                    .frame(width: 385)
                    
                Spacer()
                
                Text("Discover your dream job here")
                    .font(.system(size: 34))
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.spotifyIndigo)
                    .padding(.bottom, 12)
                
                Text("Explore all the existing jobs based on your skills and study major")
                    .font(.system(size: 14, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.spotifyBlack)
                
                Spacer()
                
                HStack(spacing: 15){
                    
//                    NavigationLink(destination: loginView()) {
//                        Text("Login")
//                            .font(.system(size: 20, weight: .semibold))
//                            .foregroundStyle(.white)
//                    }
//                    .frame(width: 160, height: 60)
//                    .background(.spotifyIndigo)
//                    .clipShape(.buttonBorder)
//                    .shadow(color: .indigo.opacity(0.5), radius: 2, x: 2, y: 2)
//               
                    
                    Button(action: {
                        print("Login Tapped")
                        navigationPath.append("loginView")
                    }, label: {
                        Text("Login")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(width: 160, height: 60)
                            .background(.spotifyIndigo)
                            .clipShape(.buttonBorder)
                            .shadow(color: .indigo.opacity(0.5), radius: 2, x: 2, y: 2)
                    })
                    
                    
//                    NavigationLink(destination: registerView()) {
//                        Text("Register")
//                            .font(.system(size: 20, weight: .semibold))
//                            .foregroundStyle(.black)
//                    }
//                    .frame(width: 160, height: 60)
                    Button(action: {
                        navigationPath.append("registerView")
                    }, label: {
                        Text("Register")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.indigo)
                            .frame(width: 160, height: 60)
                            .clipShape(.buttonBorder)
                    })
                    
                }
                
                Spacer()
            }
            
            .navigationDestination(for: String.self) { viewName in
                if viewName == "loginView" {
                    loginView(navigationPath: $navigationPath)
                } else if viewName == "registerView" {
                   // HomeView(navigationPath: $navigationPath)
                }
            }
        }
        
        
    }
}

#Preview {
    welcomeView()
}
