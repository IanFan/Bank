//
//  HomeAdView.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/9.
//

import Foundation
import UIKit

class HomeAdView: UIView {
    let scale: CGFloat = UIFactory.getScale()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupDefaultData() {
    }
    
    private func setupViews() {
    }
}
