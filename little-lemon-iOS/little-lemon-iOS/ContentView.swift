//
//  ContentView.swift
//  little-lemon-iOS
//
//  Created by Jose Rojas on 24/11/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
            Text("Select an item")
        }
    }
    
}

#Preview {
    ContentView()
}
