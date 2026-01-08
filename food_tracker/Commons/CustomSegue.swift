//
//  CustomSegue.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 08/01/26.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    
    override func perform() {
        guard let window = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene }).first?
            .windows.first else { return }
        
        window.rootViewController = destination

        UIView.transition(with: window, duration: 0.6, options: .transitionCrossDissolve, animations: { [weak self] in
            window.rootViewController = self?.destination
        }, completion: nil)
    }
    
}
