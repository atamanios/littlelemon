//
//  MenuModel.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 21/02/2023.
//

import Foundation

struct JSONMenu: Codable {
    let menu: [MenuItem]
}

struct MenuItem: Codable, Identifiable {
    
    var id: Int
    let title: String
    let price: String
    let itemDescription: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        
        case itemDescription = "description"
        case id, title, price, image, category
        
    }
}
