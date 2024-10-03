//
//  splashView.swift
//  Salaam
//
//  Created by Gulam Ali on 29/09/24.
//

import SwiftUI

struct splashView: View {
    
    @State private var isSplashActive : Bool = true
    
    var body: some View {
        ZStack{
            Color.spotifyBlack.ignoresSafeArea()
            if isSplashActive{
                Circle()
                    .fill(Color.spotifyDarkGrey)
                    .frame(width: 200, height: 200)
                    .overlay {
                        Text("S")
                            .font(.system(size: 80))
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.indigo)
                    }
            }else{
                userView()
            }
    
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
                isSplashActive.toggle()
            })
        })
    }
}

#Preview {
    splashView()
}
