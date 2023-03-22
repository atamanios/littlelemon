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
    
    @ObservedObject var dishesRetriever = DishesRetriever()
    
    @Binding var searchText: String
    
    @State var bindingCategory = [BindingCategory(category: "starters"), BindingCategory(category: "mains"), BindingCategory(category: "desserts"), BindingCategory(category: "drinks")]

    
    var body: some View {
        VStack(alignment: .leading){
 
            Text("Order for Delivery!")
                .padding(.leading, 15)
                .foregroundColor(.secondaryDarkGray)
                .font(.karla(size: 20,.medium))
            
            ScrollView(.horizontal) {
                
                HStack {
                    
                    ForEach($bindingCategory, id: \.self) { category in
                    
                        Toggle(isOn: category.isShown) {
                            Text(category.category.wrappedValue.localizedCapitalized)
                        }
                        .toggleStyle(.button)
                        .tint(.gray)
                        .foregroundColor(.primaryGreen)
                        .padding(.vertical)
                        .padding(.leading)
                    }
                }
            }
            
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes:[Dish]) in

                List {

                    ForEach(dishes, id:\.self) { dish in
                        //TODO: Fix layout
                            HStack {
                                
                                VStack(alignment: .leading){
                                    Text("\(dish.title ?? "NA")")
                                        .foregroundColor(.secondaryDarkGray)
                                        .font(.karla(size: 20, .medium))
                                        
                                    
                                    Text("\(dish.itemDescription ?? "NA")")
                                        .lineLimit(2)
                                        .foregroundColor(.primaryGreen)
                                        .font(.karla(size: 14))
                                        .padding(.vertical, 2)
                                    
                                    Text("$\(dish.price ?? "NA")")
                                        .foregroundColor(.primaryGreen)
                                        .font(.karla(size: 20, .medium))
                                        
                                }
                                
                                Spacer()
                                
                                AsyncImage(url: URL(string: dish.image!), content: { image in
                                    image
                                        .resizable()
                                        .scaledToFill()

                                }, placeholder: {
                                    
                                    ProgressView()
                                    
                                })
                                .frame(width: 125, height: 125)
                                .aspectRatio(1, contentMode: .fit)
                                .clipped()
                                
                            }
                            .padding(.trailing, 2)
                    }
                }
                .listStyle(.plain)
            }
        }
        .task {
            
            await dishesRetriever.reload(viewContext)
            
        }
    }
    
    struct BindingCategory: Hashable {
        
        var category: String
        var isShown = true
        
    }
        
    func buildSortDescriptors() -> [NSSortDescriptor] {
        let sorter:NSSortDescriptor = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))
        

        return [sorter]
    }
    
    func buildPredicate() -> NSPredicate {
        
        var titlePredicate = NSPredicate(value: true)
        var categoryPredicate:[NSPredicate] = []
        
        
        if !searchText.isEmpty {
            titlePredicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }

        bindingCategory.forEach {
            if $0.isShown {
            categoryPredicate.append(NSPredicate(format: "category MATCHES[cd] %@", $0.category))
            }
            
        }
        
        let categoryCompoundPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: categoryPredicate)
        
        
        return NSCompoundPredicate(type: .and, subpredicates: [titlePredicate, categoryCompoundPredicate])
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu(searchText: .constant(""))
    }
}
