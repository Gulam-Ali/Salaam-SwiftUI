//
//  passwordTextFieldView.swift
//  Salaam
//
//  Created by Gulam Ali on 05/10/24.
//

import SwiftUI

struct passwordTextFieldView: View {
    
    @Binding var password : String
    var placeholder : String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            TextField(placeholder, text: $password)
                .padding()
                .background(.secondaryBlue)
                .cornerRadius(12.0)
                .padding(.horizontal, 25)
        }
        
    }
}
#Preview {
    passwordTextFieldView(password: .constant(""))
}
