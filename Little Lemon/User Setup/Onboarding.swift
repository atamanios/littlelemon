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
var kMobile = "mobile key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var mobile = ""
    @State var isLoggedIn = false
    
    @State var errorMessage = ""
    @State var showFormInvalidMessage = false
    
    @State var searchText = ""
    @State var isVisible = false

    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                Image("Logo").resizable().scaledToFit().frame(width: 200)
                
                HeroSection(searchText: $searchText, isVisible: $isVisible)
                
                VStack(alignment: .leading) {
                    
                    UserInfoTextField(firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile, showMobileSetting: false)

                }
                .padding(.leading)
                .padding(.trailing)
                .padding(.bottom)
                
                Button(action: {

                   validateForm()
                    
                }, label: {
                    
                    Text("Register")
                    
                })
                .padding(10)
                .frame(width: 160)
                .background(Color.primaryGreen)
                .mask(RoundedRectangle(cornerRadius: 10))
                .tint(.secondaryLightGray)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 1))
                
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                MainMenu(searchText: $searchText, isVisible: $isVisible)
                    .navigationBarBackButtonHidden()
            }
            
            .alert("ERROR", isPresented: $showFormInvalidMessage, actions: {
                Button("OK", role: .cancel) { }
            }, message: {
                Text(errorMessage)
            })
            
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    
                    isLoggedIn = true
                    isVisible = true
              
                }
            }
        }
    }
    
    private func validateForm() {
        
        let firstNameIsValid = isValid(name: firstName)
        let lastNameIsValid = isValid(name: lastName)
        let emailIsValid = isValid(email: email)
        
        guard firstNameIsValid && lastNameIsValid && emailIsValid
        else {
            var invalidNameMessage = ""
            if firstName.isEmpty || lastName.isEmpty || !isValid(name: firstName) || !isValid(name: lastName) {
                invalidNameMessage = "Names can only contain letters and must have at least 2 characters\n\n"
            }
            var invalidEmailMessage = ""
            if email.isEmpty || !isValid(email: email) {
                
                invalidEmailMessage = "The email is invalid and cannot be blank"
            }
            
            self.errorMessage = "Found these error in the form: \n\n \(invalidNameMessage) \(invalidEmailMessage)"
            
            showFormInvalidMessage.toggle()
            return
        }
        
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
        
        
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
        isLoggedIn = true
        isVisible = true
        
    }
    
    func isValid(name: String) -> Bool {
        guard !name.isEmpty,
              name.count > 1
        else { return false }
        for chr in name {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") && !(chr == " ") ) {
                return false
            }
        }
        return true
    }
    
    func isValid(email:String) -> Bool {
        guard !email.isEmpty else { return false }
        let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
        let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
        return emailValidationPredicate.evaluate(with: email)
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
