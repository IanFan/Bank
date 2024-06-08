//
//  MainTabBarController.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation
import UIKit

enum MainTabEnum: Int {
    case Home = 0
    case Account = 1
    case Location = 2
    case Service = 3
    
    var stringValue: String {
        switch self {
        case .Home:
            return "Home"
        case .Account:
            return "Account"
        case .Location:
            return "Location"
        case .Service:
            return "Service"
        }
    }
    
    var imageName: String {
        switch self {
        case .Home:
            return "icTabbarHomeActive"
        case .Account:
            return "icTabbarAccount"
        case .Location:
            return "icTabbarLocationActive"
        case .Service:
            return "icTabbarLocationActive"
        }
    }
    
    var selectedImageName: String {
        switch self {
        case .Home:
            return "icTabbarHomeActive"
        case .Account:
            return "icTabbarAccount"
        case .Location:
            return "icTabbarLocationActive"
        case .Service:
            return "icTabbarLocationActive"
        }
    }
}

class MainTabBarController: UITabBarController {
    var customTabBar: MainTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.isHidden = true
        
        let firstVC = createMainViewController(tabEnum: .Home)
        let secondVC = createMainViewController(tabEnum: .Account)
        let thirdVC = createMainViewController(tabEnum: .Location)
        let forthVC = createMainViewController(tabEnum: .Service)
        self.viewControllers = [firstVC, secondVC, thirdVC, forthVC]
        
        let customTabBar = MainTabBar()
        self.view.addSubview(customTabBar)
        customTabBar.setupTabBar(tabBarConroller: self)
    }
    
    private func createMainViewController(tabEnum: MainTabEnum) -> HomeViewController {
        let vc = HomeViewController()
        vc.tabBarItem = createTabBarItem(tabEnum: tabEnum)
        return vc
    }
    
    private func createTabBarItem(tabEnum: MainTabEnum) -> UITabBarItem {
        let titleStr = tabEnum.stringValue
        let tabTitleColorHexSelect: String = "#FF8861"
        let tabTitleColorHex: String = "#555555"
        let imageName = tabEnum.imageName
        let selectedImageName = tabEnum.selectedImageName
        
        let title = isPad() ? "" : titleStr
        let tab = UITabBarItem.init(title: title,
                                    image: UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal),
                                    selectedImage: UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal))
        tab.setTitleTextAttributes([.foregroundColor : UIColor(hexString: tabTitleColorHex)], for: .normal)
        tab.setTitleTextAttributes([.foregroundColor : UIColor(hexString: tabTitleColorHexSelect)], for: .selected)
        tab.tag = tabEnum.rawValue
        
        tab.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 10)
        tab.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        return tab
    }
}
