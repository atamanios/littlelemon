//
//  CreateDishes.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 21/02/2023.
//

import Foundation
import CoreData

extension Dish {
    
    private static func request() -> NSFetchRequest<NSFetchRequestResult> {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: String(describing: Self.self))
        request.returnsDistinctResults = true
        request.returnsObjectsAsFaults = true
        return request
    }

    static func createDishesFrom(menuItems:[MenuItem], _ context: NSManagedObjectContext) {
        
        for menuItem in menuItems {
            guard let _ = exists(name: menuItem.title, context) else {
                continue
            }
            let oneDish = Dish(context: context)
            oneDish.title = menuItem.title
            oneDish.price = menuItem.price
//            oneDish.description = menuItem.description
            oneDish.image = menuItem.image
            
            
        }
        
    }
    
    static func exists(name: String,
                       _ context:NSManagedObjectContext) -> Bool? {
        let request = Dish.request()
        let predicate = NSPredicate(format: "name CONTAINS[cd] %@", name)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dish]
            else {
                return nil
            }
            return results.count > 0
        } catch (let error){
            print(error.localizedDescription)
            return false
        }
    }
    

}

