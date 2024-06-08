//
//  MainTabBar.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation
import UIKit

class MainTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTabBar(tabBarConroller: UITabBarController) {
        setup(tabBarConroller: tabBarConroller)
        roundTabBar(tabBarConroller: tabBarConroller)
        adjustTabBarPostion(tabBarConroller: tabBarConroller)
    }
    
    private func setup(tabBarConroller: UITabBarController) {
        items = tabBarConroller.tabBar.items
        barTintColor = .clear
        backgroundImage = UIImage()
        shadowImage = UIImage()
    }

    private func roundTabBar(tabBarConroller: UITabBarController) {
        let tabBar = self
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 30, y: tabBarConroller.tabBar.bounds.minY + 5, width: tabBarConroller.tabBar.bounds.width - 60, height: tabBarConroller.tabBar.bounds.height + 10), cornerRadius: (tabBarConroller.tabBar.frame.width/2)).cgPath
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
    
    private func adjustTabBarPostion(tabBarConroller: UITabBarController) {
        let tabBar = self
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBar.leadingAnchor.constraint(equalTo: tabBarConroller.view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: tabBarConroller.view.trailingAnchor),
            tabBar.bottomAnchor.constraint(equalTo: tabBarConroller.view.bottomAnchor, constant: -70),
            tabBar.heightAnchor.constraint(equalToConstant: 49)
        ])
        
        tabBar.itemPositioning = .centered
        tabBar.itemSpacing = 5
    }
}
