//
//  MainMenu.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 28/02/2023.
//

import SwiftUI

struct MainMenu: View {
    
//    TODO: everytime view reloads, redundant items added
    
    let persistence = PersistenceController.shared
    
    @Binding var searchText: String
    @Binding var isVisible: Bool
    
    
    var body: some View {
        
        NavigationStack {

            HeroSection(searchText: $searchText, isVisible: $isVisible)
                .padding(.top,10)
            
            Menu(searchText: $searchText)

                .toolbar {
                    
                    ToolbarItem(placement: .principal) {
                        
                        Image("Logo").resizable().scaledToFit()
                            
                            
                    }
                    
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        
                        NavigationLink(destination: UserProfile()) {
                            
                            Image("profile-image-placeholder").resizable().scaledToFit().frame(width: 40, height: 40)
                                .overlay(Circle().strokeBorder(lineWidth: 1).foregroundColor(.secondaryDarkGray))
                                .mask(Circle())
                            
                        }
                    }
                }
                
        }
        .toolbarBackground(.hidden, for: .automatic)
        
        .environment(\.managedObjectContext, persistence.container.viewContext)
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu(searchText: .constant(""), isVisible: .constant(true))
    }
}
