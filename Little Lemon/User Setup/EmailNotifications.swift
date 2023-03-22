//
//  EmailNotifications.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 02/03/2023.
//

import SwiftUI

struct EmailNotifications: View {
    
    @State var orderStatus = true
    @State var passwordChange = true
    @State var specialOffers = true
    @State var newsletter = true
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                
                Text("Notifications")
                    .underline()
                    .font(.karla(size: 20, .medium))
                    
//                Spacer()
                Toggle("Order Status", isOn: $orderStatus)
//                Spacer()
                Toggle("Password Change", isOn: $passwordChange)
//                Spacer()
                Toggle("Special Offers", isOn: $specialOffers)
//                Spacer()
                Toggle("Newsletter", isOn: $newsletter)
            }
            .font(.karla(size: 18, .regular)).foregroundColor(.secondaryDarkGray)
//            .toggleStyle(IOSCheckboxToggleStyle())
            
//            Spacer()
        }
        
    }
}



struct EmailNotifications_Previews: PreviewProvider {
    static var previews: some View {
        EmailNotifications()
    }
}
