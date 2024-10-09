//
//  loader.swift
//  Salaam
//
//  Created by Gulam Ali on 06/10/24.
//

import SwiftUI

struct loader: View {
    // MARK: - Properties
    @State private var showSpinner:Bool = true
    @State private var degree:Int = 270
    @State private var spinnerLength = 0.8
    
    // MARK: - Body
    var body: some View {
        ZStack {
            if showSpinner {
                Color.black.opacity(0.001)
                              .ignoresSafeArea()
                Circle()
                    .trim(from: 0.0, to: spinnerLength)
                    .stroke(LinearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: .round))
                    .frame(width: 40, height: 40)
                    .rotationEffect(Angle(degrees: Double(degree)))
                    .onAppear {
                        withAnimation(Animation.easeIn(duration: 1.5).repeatForever(autoreverses: true)) {
                            spinnerLength = 0
                        }
                        withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                            degree = 270 + 360
                        }
                    }
            }
            
        }
    }
}

#Preview {
    loader()
}
