//
//  TypeFace.swift
//  Little Lemon
//
//  Created by Ataman Deniz on 27/02/2023.
//

import SwiftUI

extension Font {
    
    
    enum MarkaziWeight: String {
        
        case regular = "Regular"
        case medium = "Medium"
        
    }
    
    enum KarlaWeight: String {
        
        case regular = "Regular"
        case bold = "Bold"
        case extraBold = "ExtraBold"
        case medium = "Medium"
        
    }
    
    static func markazi(size: CGFloat, _ weight: MarkaziWeight = .regular) -> Font {

        return .custom("MarkaziText-" + weight.rawValue, size: size)

    }

    static func karla(size: CGFloat, _ weight: KarlaWeight = .regular) -> Font {

        return .custom("Karla-" + weight.rawValue, size: size)

    }
    
}
