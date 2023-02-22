//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 20/02/2023.
//

import SwiftUI

struct UserProfile: View {
    
    let firstName = UserDefaults.standard.string(forKey: kFirstName)
    let lastName = UserDefaults.standard.string(forKey: kLastName)
    let email = UserDefaults.standard.string(forKey: kEmail)
    
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            
            Text("Personal Information")
            
            Image("profile-image-placeholder")
            
            Text(firstName ?? "John")
            Text(lastName ?? "Doe")
            Text(email ?? "jdoe@jdoe.com" )
            
            Button(action: {
                
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                
                dismiss()
                
                
            }, label: {
                Text("Logout")
                
            })
            
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
