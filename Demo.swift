//
//  Demo.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 27/02/2023.
//

import SwiftUI

struct Demo: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(.markazi(size: 60, .medium))
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.markazi(size: 60))
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.karla(size: 40, .medium))
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.karla(size: 40, .regular))
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.karla(size: 40, .extraBold))
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.karla(size: 40, .bold))
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.system(size: 40)).fontWeight(.medium)
        }
        
        
        
    }
}

struct Demo_Previews: PreviewProvider {
    static var previews: some View {
        Demo()
    }
}
