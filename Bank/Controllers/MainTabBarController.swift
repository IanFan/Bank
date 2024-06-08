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
        
        let customTabBar = createCustomTabBar()
        adjustTabBarPostion(tabBar: customTabBar)
        roundTabBar(tabBar: customTabBar)
    }
    
    private func createCustomTabBar() -> UITabBar {
        let customTabBar = UITabBar()
        customTabBar.items = tabBar.items
        customTabBar.barTintColor = .clear
        customTabBar.backgroundImage = UIImage()
        customTabBar.shadowImage = UIImage()
        self.view.addSubview(customTabBar)
        return customTabBar
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
    
    private func roundTabBar(tabBar: UITabBar) {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: self.tabBar.bounds.minY + 5, width: self.tabBar.bounds.width - 60, height: self.tabBar.bounds.height + 10), cornerRadius: (self.tabBar.frame.width/2)).cgPath
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.3
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor
  
        tabBar.layer.insertSublayer(layer, at: 0)
    }
    
    private func adjustTabBarPostion(tabBar: UITabBar) {
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70),
            tabBar.heightAnchor.constraint(equalToConstant: 49)
        ])
        
        tabBar.itemPositioning = .centered // 可以选择 .automatic 或 .fill 来调整布局方式
        tabBar.itemSpacing = 5
    }
}

extension MainTabBarController: MainTabBarDelegate {
    func tabBar(_ tabBar: MainTabBar, didSelectTabAt index: Int) {
        selectedIndex = index
    }
}
