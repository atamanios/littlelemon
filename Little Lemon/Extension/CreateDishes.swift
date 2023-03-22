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
           
            if !checkRedundantDishItem(title: menuItem.title, context) {
                
                let oneDish = Dish(context: context)
                oneDish.title = menuItem.title
                oneDish.price = menuItem.price
                oneDish.itemDescription = menuItem.itemDescription
                oneDish.image = menuItem.image
                oneDish.category = menuItem.category
            
                
            }
        }
        
    }
    
    static func checkRedundantDishItem(title: String, _ context: NSManagedObjectContext) -> Bool {
//        This function checks if name matches to an identical entry in the Dish entity and returns true if correct.
        
        let request = Dish.fetchRequest()
        
        let predicate = NSPredicate(format: "title == [cd] %@", title)
        
        request.predicate = predicate
        
        
        do {
            
            let result = try context.fetch(request)
           
            guard result.count > 0
            else {return false}
            
            return true
            
        } catch(let error) {
            print(error.localizedDescription)
            return false
            
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
    
    static func delete(with name: String,
                       _ context:NSManagedObjectContext) -> Bool {
        let request = Dish.request()
        
        let predicate = NSPredicate(format: "name == %@", name)
        request.predicate = predicate
        
        do {
            guard let results = try context.fetch(request) as? [Dish],
                  results.count == 1,
                  let dish = results.first
            else {
                return false
            }
            context.delete(dish)
            return true
        } catch (let error){
            print(error.localizedDescription)
            return false
        }
    }
    
    
    class func deleteAll(_ context:NSManagedObjectContext) {
        let request = Dish.request()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        
        do {
            guard let persistentStoreCoordinator = context.persistentStoreCoordinator else { return }
            try persistentStoreCoordinator.execute(deleteRequest, with: context)
            save(context)

        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    static func save(_ context:NSManagedObjectContext) {
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Unresolved error \(error), \(error.userInfo)")
        }
    }
    

}

