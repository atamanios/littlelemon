//
//  Menu.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 19/02/2023.
//

import SwiftUI
import CoreData

struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    
    var body: some View {
        VStack{
            
            Text("Title")
            Text("Loaction")
            Text("Description")
            
            TextField("Search Menu", text: $searchText, prompt: Text("Search..."))
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes:[Dish]) in

                List {

                    ForEach(dishes, id:\.self) { dish in

                        HStack {

                            Text("\(dish.title ?? "NA") \(dish.price ?? "NA") \(dish.category ?? "NA") \(dish.description)")

                            AsyncImage(url: URL(string: dish.image!), content: { image in
                                image.resizable().scaledToFit()
                            
                            }, placeholder: {
                                ProgressView()
                            })
                                
                        }
                    }
                }
            }
        }
        .onAppear {
            getMenuData()
        }
    }
    
    func getMenuData() {
        
        PersistenceController.shared.clear()
        
        let JSONAddress = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: JSONAddress)!
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {data,response,error in
            
            if let data = data {
                let decoder = JSONDecoder()
                let decodedData = try! decoder.decode(JSONMenu.self, from: data)
                
                let menu = decodedData.menu
                print("this works")
                
                for item in menu {
                    
                    let oneDish = Dish(context: viewContext)
                    
                    oneDish.title = item.title
                    oneDish.price = item.price
                    oneDish.image = item.image
//                    oneDish.description = item.description
                    oneDish.category = item.category
            
                }
                
                try? viewContext.save()
                
                
            }
        }
        task.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        let sorter:NSSortDescriptor = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))
        

        return [sorter]
    }
    
    func buildPredicate() -> NSPredicate {
        
        if !searchText.isEmpty {
            
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
            
        } else {
           return NSPredicate(value: true)
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
