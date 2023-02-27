//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 19/02/2023.
//

import SwiftUI

var kFirstName = "first name key"
var kLastName = "last name key"
var kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
   
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                HeaderAndHero()
                
                VStack(alignment: .leading) {
                    
                    Text("First Name *").foregroundColor(.secondaryDarkGray)
                    TextField("", text: $firstName, prompt: Text("Tilly"))
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 1).foregroundColor(.gray))
            
                    Text("Last Name *")
                    TextField("", text: $lastName, prompt: Text("Doe"))
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 1).foregroundColor(.gray))
                    
                    Text("Email *")
                    TextField("Email", text: $email, prompt: Text(verbatim: "tillydoe@example.com"))
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 1).foregroundColor(.gray))
                    
                }
                .padding(.leading)
                .padding(.trailing)
                
                Button(action: {
                    //                TODO: Validate email format
                    if !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty {
                        
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        
                        
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                        
                    }
                    
                }, label: {
                    
                    Text("Register")
                    
                })
                
                
                
                
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    
                    isLoggedIn = true
                }
                
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
