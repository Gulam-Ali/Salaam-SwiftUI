//
//  tct.swift
//  Salaam
//
//  Created by Gulam Ali on 05/10/24.
//

import SwiftUI

struct emailTextFieldView: View {
    
    @Binding var email : String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            // TextField for Email
            TextField("Email", text: $email)
                .padding()
                .background(Color.secondaryBlue)
                .cornerRadius(12.0)
                .padding(.horizontal, 25)
                .keyboardType(.emailAddress)
        }
    }
}

#Preview {
    ZStack{
        //Color.spotifyBlack.ignoresSafeArea()
        emailTextFieldView(email: .constant(""))
    }
}
