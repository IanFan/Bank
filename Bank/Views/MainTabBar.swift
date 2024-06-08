//
//  MainTabBar.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation
import UIKit

protocol MainTabBarDelegate: AnyObject {
    func tabBar(_ tabBar: MainTabBar, didSelectTabAt index: Int)
}

class MainTabBar: UIView {
    weak var delegate: MainTabBarDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = .randomColor
        layer.shadowOffset = CGSize(width: 0, height: -3)
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 6

        let numberOfTabs = 3
        let buttonWidth = frame.width / CGFloat(numberOfTabs)
        let buttonHeight = frame.height

        for i in 0..<numberOfTabs {
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: CGFloat(i) * buttonWidth, y: 0, width: buttonWidth, height: buttonHeight)
            button.tag = i
            button.setImage(UIImage(named: "icTabbarHomeActive"), for: .normal)
            button.imageEdgeInsets = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0) // Adjust icon position
            button.addTarget(self, action: #selector(tabButtonTapped(_:)), for: .touchUpInside)
            addSubview(button)
        }
    }

    @objc private func tabButtonTapped(_ sender: UIButton) {
        delegate?.tabBar(self, didSelectTabAt: sender.tag)
    }
}
