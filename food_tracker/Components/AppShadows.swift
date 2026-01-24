//
//  AppShadows.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 20/01/26.
//

import SwiftUI

struct DropShadowLight: ViewModifier {
    func body(content: Content) -> some View {
        content.shadow(
            color: ThemeColors.textSecondary.opacity(0.5),
            radius: 10,
            x: 0,
            y: 2
        )
    }
}

extension View {
    func dropShadowLight() -> some View {
        modifier(DropShadowLight())
    }
}
