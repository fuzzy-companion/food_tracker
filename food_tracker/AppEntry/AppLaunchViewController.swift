//
//  AppLaunchViewController.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 07/01/26.
//

import Foundation
import UIKit

class AppLaunchViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.performSegue(withIdentifier: "presentDescriptionScreen", sender: nil)
        }
    }
    
}
