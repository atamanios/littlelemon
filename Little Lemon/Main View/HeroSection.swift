//
//  HeroSection.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 28/02/2023.
//

import SwiftUI

struct HeroSection: View {
    
    @Binding var searchText: String
    @Binding var isVisible: Bool
    
    var body: some View {
        ZStack {
            
            Rectangle().foregroundColor(.primaryGreen).frame(height: isVisible ? 320 : 260)
            
            VStack(alignment: .leading){
                
                Text("Little Lemon").font(.markazi(size: 64, .medium)).foregroundColor(.primaryYellow)
                
                    .padding(.bottom, -40)
                    .padding(.leading)
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        
                        Text("Chicago").font(.markazi(size: 40,.medium)).padding(.bottom, 5).foregroundColor(.secondaryLightGray)
                        
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.").frame(width: 200).foregroundColor(.secondaryLightGray).font(.karla(size: 16, .medium)).padding(.bottom, 5).truncationMode(.tail).lineLimit(5, reservesSpace: true)
                        
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    Image("Hero image").resizable().scaledToFill().frame(width: 150, height: 175)
                        .mask(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).frame(width: 150,height: 150))
                        .padding(.trailing)
                }
                
                
                
                if isVisible {
                    
                    HStack{
                        
                        Image(systemName: "magnifyingglass").padding(.leading, 5)
                        
                        TextField("Search Menu", text: $searchText,
                                  prompt: Text(verbatim: "Search...")
                            .foregroundColor(.secondaryLightGray))
                    }
                    .font(.karla(size: 20, .regular))
                    .foregroundColor(.secondaryLightGray)
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 5)
                        .strokeBorder(lineWidth:1)
                        .foregroundColor(.secondaryLightGray))
                    .padding(.horizontal)
                    .padding(.bottom)
                }
                
            }
        }
    }
}

struct HeroSection_Previews: PreviewProvider {
    static var previews: some View {
        HeroSection(searchText: .constant(""), isVisible: .constant(true))
    }
}
