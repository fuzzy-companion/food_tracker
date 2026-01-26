//
//  DashboardView.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 19/01/26.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                DashboardHeaderView().padding(.vertical, 16)
                ScrollView {
                    Text("Dashboard Content")
                }
            }
            .toolbar(.hidden)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    DashboardView()
}
