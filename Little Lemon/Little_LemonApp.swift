//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 13/02/2023.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            Onboarding().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
