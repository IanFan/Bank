//
//  NotificationViewController.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/9.
//

import Foundation
import UIKit

class NotificationViewController: UIViewController {
    var scale: CGFloat!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    deinit {
        print("\(type(of: self)) deinit")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(hexString: "#FAFAFA")
        self.view.backgroundColor = .randomColor
        
        scale = UIFactory.getWindowSize().width / 375
        setupUI()
    }
    
    func setupUI() {
    }
}
