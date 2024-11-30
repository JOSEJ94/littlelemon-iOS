//
//  Home.swift
//  little-lemon-iOS
//
//  Created by Jose Rojas on 27/11/24.
//

import SwiftUI

struct Home: View {
    var persistence: PersistenceController = .shared
    
    var body: some View {
        TabView{
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
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
