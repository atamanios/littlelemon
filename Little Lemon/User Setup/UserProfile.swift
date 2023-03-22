//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 20/02/2023.
//

import SwiftUI

struct UserProfile: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var mobile = ""
    
//    private var textFieldTitleSize: CGFloat = 16
    
    var body: some View {
        
        NavigationStack {
            VStack {
                
                HStack {
                 
                    Image("profile-image-placeholder").resizable().scaledToFit().frame(width: 100)
                        .mask(Circle())
                        .padding(.horizontal)
                        
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Change")
                        
                    })
                    .buttonStyle(.borderedProminent)
                    .tint(Color.primaryGreen)
                    .padding(.trailing)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Remove")
                    })
                    .buttonStyle(.bordered)
                    .foregroundColor(.secondaryDarkGray)
                    .tint(.secondaryLightGray)
                    .border(.black)
                    
                    Spacer()
                    
                }
                
                UserInfoTextField(firstName: $firstName, lastName: $lastName, email: $email, mobile: $mobile, showMobileSetting: true)
                
                EmailNotifications()
                    .padding(.horizontal,10)
                    .padding(.bottom, 10)
                
                NavigationLink(destination: Onboarding(), label: {
                    
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(maxWidth: .infinity, maxHeight: 45)
                            .foregroundColor(.primaryYellow)
                        
                        Text("Logout").foregroundColor(.secondaryDarkGray)
                        
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                })
                    .simultaneousGesture(TapGesture().onEnded{
                        
                        clearUserDefaults()
                    
                    })
                
                HStack{
                    
                    Button(action: {
                        
                        updateStateStrings()
                        
                    }, label: {
                        Text("Discard changes")
                        
                    })
                    .padding(10)
                    .frame(width: 160)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                    .tint(.secondaryLightGray)
                    .foregroundColor(.secondaryDarkGray)
                    .padding(.trailing)
                    
                    Button(action: {
                        
                        updateUserDefaults()
                        
                    }, label: {
                        
                        Text("Save changes")
                    })
                    .padding(10)
                    .frame(width: 160)
                    .background(Color.primaryGreen)
                    .mask(RoundedRectangle(cornerRadius: 10))
                    .tint(.secondaryLightGray)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1))
                    
                }
            }
            .toolbar {
            
                ToolbarItem(placement: .principal) {
                    
                    Image("Logo").resizable().scaledToFit()
                    
                }
            }
        }
        .onAppear {
            
            updateStateStrings()
        }
    }
    
    func clearUserDefaults() {
        
        UserDefaults.standard.set("", forKey: kFirstName)
        UserDefaults.standard.set("", forKey: kLastName)
        UserDefaults.standard.set("", forKey: kEmail)
        UserDefaults.standard.set(false, forKey: kIsLoggedIn)

    }
    
    func updateUserDefaults() {
        
        UserDefaults.standard.set(firstName, forKey: kFirstName)
        UserDefaults.standard.set(lastName, forKey: kLastName)
        UserDefaults.standard.set(email, forKey: kEmail)
    
    }
    
    func updateStateStrings() {
       
        guard !kFirstName.isEmpty, !kLastName.isEmpty, !kEmail.isEmpty else { return }
        
        firstName = UserDefaults.standard.string(forKey: kFirstName)!
        lastName = UserDefaults.standard.string(forKey: kLastName)!
        email = UserDefaults.standard.string(forKey: kEmail)!
        
    }
    
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
