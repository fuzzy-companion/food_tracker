//
//  SecondScreen.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 20/01/26.
//

import SwiftUI

struct SecondScreen: View {
    
    // Simple state to increment
    @State var count: Int = 0
    
    var body: some View {
        
        VStack {
            Text("Count: \(count)").padding(
                EdgeInsets.init(top: 8,
                                leading: 16,
                                bottom: 8,
                                trailing: 16))
            HStack {
                Button {
                    count += 1
                } label: {
                    Text("+")
                }.padding(EdgeInsets.init(top: 0,
                                          leading: 16,
                                          bottom: 0,
                                          trailing: 16))
                Button {
                    count -= 1
                } label: {
                    Text("-")
                }.padding(EdgeInsets.init(top: 0,
                                          leading: 16,
                                          bottom: 0,
                                          trailing: 16))
                .onChange(of: count) {
                    if count < 0 {
                        count = 0
                    }
                }
            }
        }
    }
}
