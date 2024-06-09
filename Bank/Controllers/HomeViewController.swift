//
//  HomeViewController.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    var messageViewModel = MessageViewModel()
    var amountViewModel = AmountViewModel()
    var favoriteViewModel = FavoriteViewModel()
    var adBannerViewModel = AdBannerViewModel()
    
    let scale: CGFloat = UIFactory.getScale()
    var refreshControl: UIRefreshControl!
    var navigationView: HomeNavigationView!
    var amountView: HomeAmountView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    deinit {
        print("\(type(of: self)) deinit")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.messageViewModel.delegate = self
        self.amountViewModel.delegate = self
        self.favoriteViewModel.delegate = self
        self.adBannerViewModel.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        self.messageViewModel.loadData(isRefresh: false)
        self.amountViewModel.loadData(isRefresh: false)
        self.favoriteViewModel.loadData(isRefresh: false)
        self.adBannerViewModel.loadData(isRefresh: false)
    }
    
    func setupUI() {
        view.backgroundColor = ColorEnum.localWhite2.color
        
//        let button = UIFactory.createTextButton(size: 10, text: "button", textColor: .black, bgColor: .gray)
//        self.view.addSubview(button)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
//            button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100),
//            button.widthAnchor.constraint(equalToConstant: 100),
//            button.heightAnchor.constraint(equalToConstant: 50),
//        ])
        
        // UIScrollView
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = ColorEnum.systemGray10.color
        scrollView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.refreshControl = refreshControl
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // contentView
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // main stack
        let mainStackView = UIStackView()
        mainStackView.axis = .vertical
        mainStackView.spacing = 0
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        // navigationView
        let navigationView = HomeNavigationView()
        view.addSubview(navigationView)
        self.navigationView = navigationView
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 48*scale),
        ])
        mainStackView.addArrangedSubview(navigationView)
        
        // amountView
        let amountView = HomeAmountView()
        self.amountView = amountView
        navigationView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(amountView)
        
        // medium stack，include small stack
        for _ in 1...3 {
            let mediumView = UIView()
            mediumView.backgroundColor = .blue
            mediumView.translatesAutoresizingMaskIntoConstraints = false

            let smallStackView = UIStackView()
            smallStackView.axis = .vertical
            smallStackView.spacing = 0
            smallStackView.translatesAutoresizingMaskIntoConstraints = false
            mediumView.addSubview(smallStackView)
            
            NSLayoutConstraint.activate([
                smallStackView.topAnchor.constraint(equalTo: mediumView.topAnchor, constant: 50),
                smallStackView.bottomAnchor.constraint(equalTo: mediumView.bottomAnchor),
                smallStackView.leadingAnchor.constraint(equalTo: mediumView.leadingAnchor),
                smallStackView.trailingAnchor.constraint(equalTo: mediumView.trailingAnchor)
            ])
            
            for _ in 1...4 {
                let smallView = UIView()
                smallView.backgroundColor = .randomColor
                smallView.translatesAutoresizingMaskIntoConstraints = false
                smallView.heightAnchor.constraint(equalToConstant: 100).isActive = true
                smallStackView.addArrangedSubview(smallView)
            }

            mainStackView.addArrangedSubview(mediumView)
        }
        
        // action
        navigationView.btnAvatarAction = { [weak self] in
            guard let self = self else { return }
            print("btnAvatarAction")
        }
        navigationView.btnBellAction = { [weak self] in
            guard let self = self else { return }
            print("btnBellAction")
            self.navigationView?.setupContent(isShowBellBadge: false)
            let vc = NotificationViewController(messageViewModel: self.messageViewModel)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

extension HomeViewController {
    @objc func handleRefresh() {
//        self.messageViewModel.loadData(isRefresh: true)
        self.amountViewModel.loadData(isRefresh: true)
//        self.favoriteViewModel.loadData(isRefresh: true)
//        self.adBannerViewModel.loadData(isRefresh: true)
        
        self.refreshControl?.endRefreshing()
    }
}

extension HomeViewController: MessageViewModelProtocol {
    func updateMessageUI() {
        print(#function)
        navigationView?.setupContent(isShowBellBadge: messageViewModel.messages.count > 0)
    }
}

extension HomeViewController: AmountViewModelProtocol {
    func updateAmountUI() {
        let currs = ["USD", "KHR"]
        for curr in currs {
            let sum = amountViewModel.getSumByCurr(curr)
            amountView?.updateContent(curr: curr, sum: sum)
        }
    }
}

extension HomeViewController: FavoriteViewModelProtocol {
    func updateFavoriteUI() {
        let objs = favoriteViewModel.favorites
//        for obj in objs {
//            print("obj nickname: \(obj.nickname)")
//            print("obj transType: \(obj.transType)")
//        }
        print("favorites count: \(objs.count)")
    }
}

extension HomeViewController: AdBannerViewModelProtocol {
    func updateAdBannerUI() {
        let objs = adBannerViewModel.adBanners
//        for obj in objs {
//            print("obj adSeqNo: \(obj.adSeqNo)")
//            print("obj adSeqNo: \(obj.linkUrl)")
//        }
        print("adBanners count: \(objs.count)")
    }
}
