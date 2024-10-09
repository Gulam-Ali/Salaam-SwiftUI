//
//  button.swift
//  Salaam
//
//  Created by Gulam Ali on 05/10/24.
//

import Foundation
import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, minHeight: 60)
            .background(.spotifyIndigo)
            .clipShape(.buttonBorder)
            .shadow(color: .indigo.opacity(0.5), radius: 2, x: 2, y: 2)
            .padding(.horizontal, 25)
    }
    
}
