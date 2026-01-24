//
//  DashboardView.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 19/01/26.
//

import SwiftUI

struct DashboardView: View {
    init() {
        for family in UIFont.familyNames {
            print(family)
            for names in UIFont.fontNames(forFamilyName: family) {
                print("== \(names)")
            }
        }
    }
    var body: some View {
        NavigationStack {
            HStack {
                ProfileImageComponent()
                VStack(alignment: .leading, spacing: 4) {
                    Text("Hello").font(LatoFonts.regular(14))
                    Text("Hello").font(LatoFonts.regular(20))
                }.padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
            }
        }
    }
}

#Preview {
    DashboardView()
}
