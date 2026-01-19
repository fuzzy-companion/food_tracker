//
//  ViewController.swift
//  food_tracker
//
//  Created by Liyakhat Yousuf Mogal on 07/01/26.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    @IBOutlet private var navigationButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func navigateToDashboard(_ sender: UIButton) {
        let dashboardContentView = DashboardView()
        let convertToViewController = UIHostingController(rootView: dashboardContentView)
        
        convertToViewController.modalPresentationStyle = .fullScreen
        
        if let view = navigationController {
            view.pushViewController(convertToViewController, animated: true)
        } else {
            present(convertToViewController, animated: true)
        }
    }
}

