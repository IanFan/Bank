//
//  CustomNavigationBar.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/9.
//

import Foundation
import UIKit

class CustomNavigationBar: UIView {
    private lazy var backButton: UIButton = {
        let button = UIFactory.createImageButton(name: "iconArrowWTailBack")
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    // 标题标签
    private lazy var titleLabel: UILabel = {
        let label = UIFactory.createLabel(size: 18*scale, text: "Notificaiton".localized(), color: ColorEnum.systemGray10.color, font: .SFProTextMedium)
        label.textAlignment = .center
        return label
    }()
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var backButtonAction: (() -> Void)?
    let scale: CGFloat = UIFactory.getWindowSize().width / 375
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupViews() {
        addSubview(backButton)
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15*scale),
            backButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 24*scale),
            backButton.heightAnchor.constraint(equalToConstant: 24*scale),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50*scale),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50*scale),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    // 上一页按钮点击事件处理
    @objc private func backButtonTapped() {
        backButtonAction?()
    }
}
