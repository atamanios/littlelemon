//
//  HeaderAndHero.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 27/02/2023.
//

import SwiftUI

struct HeaderAndHero: View {
    var body: some View {
        VStack {
            
            Image("Logo").resizable().scaledToFit().frame(width:200)
            
            ZStack {
                
                Rectangle().foregroundColor(.primaryGreen).frame(height:300)
                
                VStack(alignment: .leading){
                    
                    Text("Little Lemon").font(.markazi(size: 64)).foregroundColor(.primaryYellow)
                    
                        .padding(.bottom, -20)
                    
                    HStack {
                        
                        VStack(alignment: .leading) {
                            
                            
                            
                            Text("Chicago").font(.markazi(size: 40)).padding(.bottom).foregroundColor(.secondaryLightGray)
                            
                            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.").frame(width: 200).foregroundColor(.secondaryLightGray)
                            
                        }
                        
                        Image("Hero image").resizable().scaledToFill().frame(width: 150, height: 175)
                            .mask(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)).frame(width: 150,height: 150))
                    }
                }
            }
        }
    }
}

struct HeaderAndHero_Previews: PreviewProvider {
    static var previews: some View {
        HeaderAndHero()
    }
}
