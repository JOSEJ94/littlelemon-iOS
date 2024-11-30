//
//  Menu.swift
//  little-lemon-iOS
//
//  Created by Jose Rojas on 27/11/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var searchText: String = ""
    
    private func createSortDescriptors() -> [NSSortDescriptor] {
        [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    private func buildPredicate() -> NSPredicate {
        if searchText.isEmpty {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    var body: some View {
        VStack{
            Text("Little Lemon")
            Text("Chicago")
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
            TextField("Search menu", text: $searchText)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: createSortDescriptors()) { (dishes: [Dish]) in
                List {
                    ForEach(dishes, id: \.title) { dish in
                        HStack {
                            Text("\(dish.title!) - \(dish.price!)")
                            Spacer()
                            AsyncImage(url: URL(string: dish.image!)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .clipped()
                            } placeholder: {
                                Color.gray
                                    .frame(width: 50, height: 50)
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            MenuList.getMenuData(viewContext)
        }
    }
}

#Preview {
    Menu()
}
