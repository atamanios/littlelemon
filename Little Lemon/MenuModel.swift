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
    var id = UUID()
    let title: String
    let price: String
    let description: String
    let image: String
    
}
