//
//  ThemeColors.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 20/01/26.
//

import Foundation
import SwiftUI

enum ThemeColors {
    static let primaryBlue = Color(hex: "5BC0EB")
    static let accentYellow = Color(hex: "FDE74C")
    
    static let primaryBackground = Color(hex: "FFFFFF")
    static let secondaryBackground = Color(hex: "FFFAFF")

    static let textPrimary = Color(hex: "011627")
    static let textSecondary = Color(hex: "A5A5A5")
    static let textTeritary = Color(hex: "6F6F6F")

    static let yellowSoft = Color(hex: "FFF18F")
    static let blueSoft = Color(hex: "68D2FF")
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hex)

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
