//
//  DashboardHeaderView.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 26/01/26.
//

import SwiftUI

struct DashboardHeaderView: View {
    var body: some View {
        HStack {
            // Left content Profile image and Textual components
            HStack {
                ProfileImageComponent()
                VStack(alignment: .leading, spacing: 5) {
                    Text("Good Morning!")
                        .font(LatoFonts.regular(12))
                        .foregroundStyle(ThemeColors.textSecondary)
                    Text("Profile Name")
                        .font(LatoFonts.regular(20))
                }.padding(.horizontal, 8)
            }.padding(.leading, 16)
            
            // Added vertical spacing
            Spacer()
            
            // Added Two tap buttons
            HStack(spacing: 12) {
                HeaderIconButton(imageName: "calendar")
                HeaderIconButton(imageName: "notification_bell")
            }.padding(.trailing, 16)
        }
    }
}

#Preview {
    DashboardHeaderView()
}
