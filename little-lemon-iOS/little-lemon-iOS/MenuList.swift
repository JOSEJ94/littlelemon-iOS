//
//  MenuList.swift
//  little-lemon-iOS
//
//  Created by Jose Rojas on 28/11/24.
//

import Foundation
import CoreData

let url: String = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"

struct MenuList: Decodable {
    enum CodingKeys: CodingKey {
        case menu
    }
    
    let menu: [MenuItem]
    
    
    static func getMenuData(_ viewContext: NSManagedObjectContext) -> Void {
        PersistenceController.shared.clear()
        let serverURL = URL(string: url)!
        let request = URLRequest(url: serverURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            guard let menuList = try? JSONDecoder().decode(MenuList.self, from: data) else { return }
            debugPrint(menuList)
            
            for menuItem in menuList.menu {
                let dish = Dish(context: viewContext)
                dish.title = menuItem.title
                dish.price = menuItem.price
                dish.image = menuItem.image
                guard viewContext.hasChanges else { return}
                    do {
                         try viewContext.save()
                    } catch (let error) {
                        print(error.localizedDescription)
                    }
            }
            
        }.resume()
    }
}
