//
//  little_lemon_iOSApp.swift
//  little-lemon-iOS
//
//  Created by Jose Rojas on 24/11/24.
//

import SwiftUI

@main
struct little_lemon_iOSApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
