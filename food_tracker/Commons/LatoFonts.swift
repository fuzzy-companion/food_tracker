//
//  LatoFonts.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 20/01/26.
//

import SwiftUI

enum LatoFonts {
    static func regular(_ size: CGFloat) -> Font {
        .custom("Lato-Regular", size: size)
    }
    
    static func light(_ size: CGFloat) -> Font {
        .custom("Lato-Light", size: size)
    }
    
    static func thin(_ size: CGFloat) -> Font {
        .custom("Lato-Thin", size: size)
    }

    static func bold(_ size: CGFloat) -> Font {
        .custom("Lato-Bold", size: size)
    }
    
    static func black(_ size: CGFloat) -> Font {
        .custom("Lato-Black", size: size)
    }
}
