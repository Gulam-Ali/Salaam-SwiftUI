//
//  Alerts.swift
//  Salaam
//
//  Created by Gulam Ali on 05/10/24.
//

import Foundation
import SwiftUI

struct alertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    var dismissButton : Alert.Button? = .default(Text("Ok"))
}


struct AlertContext {
    static let invalidEmail = alertItem(title: Text("Invalid Email"), message: Text("Please enter valid email address"), dismissButton: .default(Text("Ok")))
    static let invalidPassword = alertItem(title: Text("Invalid Password"), message: Text("Please enter your valid password"), dismissButton: .default(Text("Ok")))
}
