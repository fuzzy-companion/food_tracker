//
//  ProfileImageComponent.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 20/01/26.
//

import SwiftUI

struct ProfileImageComponent: View {
    
    let image: Image? = Image("profile_default")
    
    var body: some View {
        HStack {
            image?
                .resizable()
                .scaledToFill()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(ThemeColors.secondaryBackground)
                ).dropShadowLight()
        }
    }
}

#Preview {
    ProfileImageComponent()
}
