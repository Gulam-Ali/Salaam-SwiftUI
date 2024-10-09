//
//  homeView.swift
//  Salaam
//
//  Created by Gulam Ali on 06/10/24.
//

import SwiftUI

struct homeView: View {
    
    @State private var logOutTapped = false
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
       // NavigationStack{
            ZStack{
                VStack{
                    Text(getUserName())
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Button(action: {
                        UserStorage().clearUserInfo()
                        logOutTapped.toggle()
                        navigationPath.removeLast(navigationPath.count)
                    }, label: {
                        Text("LogOut")
                            .modifier(StandardButtonStyle())
                    })
                }
            }
        //}
        
        .toolbar(.hidden, for: .navigationBar)
    }
    
    private func getUserName() -> String{
        let user = UserStorage().userInfo
        return user?.username ?? ""
    }
}

#Preview {
    homeView(navigationPath: .constant(NavigationPath()))
}
