//
//  DailyProgressTracker.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 01/02/26.
//

import SwiftUI

struct DailyProgressTracker: View {
    
    let days: Int?
    
    var body: some View {
        HStack {
            // Heading Content
            VStack(alignment: .leading, spacing: 12) {
                // Icon and image
                HStack(spacing: 8) {
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 6)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(ThemeColors.yellowSoft))
                    Text("Daily intake")
                        .font(LatoFonts.regular(16))
                        .padding(.leading, 2)
                }
                // Title text
                Text("Your daily progress").font(LatoFonts.regular(28))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: 150, alignment: .leading)
            }
            
            Spacer()
            
            // Circular Progress bar and inside content
            ZStack {
                Circle().stroke(Color.white, lineWidth: 18)
                Circle()
                    .trim(from: 0, to: 0.4)
                    .stroke(
                        ThemeColors.primaryBlue,
                        style: StrokeStyle(lineWidth: 18, lineCap: .round)
                    )
                    .rotationEffect(.degrees(90))
                VStack(spacing: 4) {
                    Text("\(days ?? 0)").font(LatoFonts.regular(16))
                    Text("days").font(LatoFonts.regular(16))
                }.padding(.all, 16)
                .background(
                    Circle()
                    .fill(ThemeColors.yellowSoft)
                )
            }.frame(height: 100)
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 26)
        .background(
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(ThemeColors.accentYellow)
                .dropShadowLight())
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    DailyProgressTracker(days: nil)
}
