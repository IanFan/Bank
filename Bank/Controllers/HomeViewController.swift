//
//  HomeViewController.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    deinit {
        print("HomeViewController Deinit")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .randomColor
    }
    
}
