//
//  MenuItem.swift
//  little-lemon-iOS
//
//  Created by Jose Rojas on 28/11/24.
//

import Foundation

struct MenuItem : Decodable {
    enum CodingKeys: CodingKey {
        case title
        case image
        case price
    }

    var title: String
    var image: String
    var price: String
}
