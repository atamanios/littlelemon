//
//  UserInfoTextField.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 02/03/2023.
//

import SwiftUI

struct UserInfoTextField: View {
    
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var mobile: String
    
    var firstNameLabel = "First Name"
    var lastNameLabel = "Last Name"
    var emailLabel = "Email"
    var mobileLabel = "Mobile"
    
    
    @State var showMobileSetting = false
    
    var textFieldTitleSize: CGFloat = 16
    var paddingSize:CGFloat = 8
    
    var body: some View {
        VStack(alignment:.leading) {
            
            Text(firstNameLabel)
                .foregroundColor(.secondaryDarkGray)
                .font(.karla(size: textFieldTitleSize))

            TextField(firstName, text: $firstName)
                .padding(paddingSize)
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 1).foregroundColor(.gray))
                .padding(.bottom, paddingSize)
            
            Text(lastNameLabel)
                .foregroundColor(.secondaryDarkGray)
                .font(.karla(size: textFieldTitleSize))
                
            
            TextField(lastName, text: $lastName)
                .padding(paddingSize)
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 1).foregroundColor(.gray))
                .padding(.bottom, paddingSize)
            
            
            Text(emailLabel)
                .foregroundColor(.secondaryDarkGray)
                .font(.karla(size: textFieldTitleSize))
            
            TextField(email, text: $email)
                .padding(paddingSize)
                .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 1).foregroundColor(.gray))
                .padding(.bottom, paddingSize)
            
            if showMobileSetting {
                
                Text(mobileLabel)
                    .foregroundColor(.secondaryDarkGray)
                    .font(.karla(size:textFieldTitleSize))
                
                TextField(mobile, text: $mobile)
                    .padding(paddingSize)
                    .overlay(RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 1).foregroundColor(.gray))
                    .padding(.bottom, paddingSize)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}

struct UserInfoTextField_Previews: PreviewProvider {
    static var previews: some View {
        UserInfoTextField(firstName: .constant("John"), lastName: .constant("Doe"), email: .constant("johndoe@johndoe.com"), mobile: .constant("0123456789"))
    }
}
