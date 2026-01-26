//
//  HeaderIconButton.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 26/01/26.
//

import SwiftUI

struct HeaderIconButton: View {
    
    var imageName: String = ""
    
    var body: some View {
        Button {
            print("\(imageName) is tapped....")
        } label: {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
                .padding(12)
                .background()
                .clipShape(Circle())
                .dropShadowLight()
        }
    }
}

#Preview {
    HeaderIconButton()
}
