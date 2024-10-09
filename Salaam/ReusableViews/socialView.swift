//
//  socialView.swift
//  Salaam
//
//  Created by Gulam Ali on 04/10/24.
//

import SwiftUI

struct socialView: View {
    
    var appleTapped :( () -> Void)? = nil
    var facebookTapped :( () -> Void)? = nil
    var googleTapped :( () -> Void)? = nil
    
    var body : some View {
        HStack{
            Button(action: {
                appleTapped?()
            }, label: {
                Image("apple-logo")
                   // .font(.title3)
                    .frame(width: 35, height: 35)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .background(Color.secondaryBlue)
                    .clipShape(Circle())
            })
            Button(action: {
                facebookTapped?()
            }, label: {
                Image("facebook-logo")
                   // .font(.title3)
                    .frame(width: 35, height: 35)
                    .frame(width: 35, height: 35)
                    .padding(5)
                    .background(Color.secondaryBlue)
                    .clipShape(Circle())
            })
            Button(action: {
                googleTapped?()
            }, label: {
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


#Preview {
    socialView()
}
