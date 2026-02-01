//
//  DashboardView.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 19/01/26.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack(spacing: 24) {
            DashboardHeaderView()
            DailyProgressTracker(days: 7).padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.all, 4)
    }
}

#Preview {
    DashboardView()
}
