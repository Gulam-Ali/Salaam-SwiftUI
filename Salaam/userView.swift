//
//  loginView.swift
//  Salaam
//
//  Created by Gulam Ali on 29/09/24.
//

import SwiftUI

struct userView: View {
    
    @State private var showSplashView : Bool = true
    
    var body: some View {
        NavigationStack{
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
                
                HStack(spacing: 12){
                    
                    NavigationLink(destination: loginView()) {
                        Text("Login")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .frame(width: 160, height: 60)
                    .background(.spotifyIndigo)
                    .clipShape(.buttonBorder)
                    .shadow(color: .indigo.opacity(0.5), radius: 2, x: 2, y: 2)
                    
                    NavigationLink(destination: registerView()) {
                        Text("Register")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                    }
                    .frame(width: 160, height: 60)
                    
                
                }
                
                Spacer()
            }
            
            
        }
        
        
    }
}

#Preview {
    userView()
}
