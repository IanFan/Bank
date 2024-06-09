//
//  NotificationViewController.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/9.
//

import Foundation
import UIKit

class NotificationViewController: UIViewController {
    let scale: CGFloat = UIFactory.getWindowSize().width / 375
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    deinit {
        print("\(type(of: self)) deinit")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(hexString: "#FAFAFA")
        self.view.backgroundColor = .randomColor
        
        setupUI()
    }
    
    func setupUI() {
        // navigation view
        
        // collectionview
//        let layout = getCompositionalLayout()
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.backgroundColor = .orange
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        view.addSubview(collectionView)
//        NSLayoutConstraint.activate([
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
    }
}
