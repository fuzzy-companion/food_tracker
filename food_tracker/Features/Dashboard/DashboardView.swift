//
//  DashboardView.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 19/01/26.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        Form {
            Text("This is first text box")
            Section {
                Text("This is inside section text box")
                Text("This is inside section second text box")
            }
            Section {
                Text("This is inside fourth section text box")
                Text("This is inside fifth section text box")
            }
        }
    }
}

#Preview {
    DashboardView()
}
