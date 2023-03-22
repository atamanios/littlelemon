//
//  DishRetriever.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 21/02/2023.
//

import Foundation
import CoreData

@MainActor
class DishesRetriever:ObservableObject {
    
    @Published var menuItems = [MenuItem]()
    
    func reload(_ coreDataContext:NSManagedObjectContext) async {
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        
        let urlSession = URLSession.shared
        
        
        
        do {
            let (data, _) = try await urlSession.data(from: url)
            let fullMenu = try JSONDecoder().decode(JSONMenu.self, from: data)
            
            menuItems = fullMenu.menu
            
            Dish.deleteAll(coreDataContext)
            
            Dish.createDishesFrom(menuItems: menuItems, coreDataContext)
            
        }
        
        catch { }
    }
    
    
}
