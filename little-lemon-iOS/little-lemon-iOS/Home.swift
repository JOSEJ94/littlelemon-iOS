//
//  Home.swift
//  little-lemon-iOS
//
//  Created by Jose Rojas on 27/11/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Menu()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            UserProfile()
                .tabItem {
                    Label("Profile", systemImage: "square.and.pencil")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    Home()
}