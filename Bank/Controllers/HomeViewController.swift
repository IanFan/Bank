//
//  HomeViewController.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    var scale: CGFloat!
    var messageViewModel = MessageViewModel()
    var amountViewModel = AmountViewModel()
    var favoriteViewModel = FavoriteViewModel()
    var adBannerViewModel = AdBannerViewModel()
    
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
        self.view.backgroundColor = UIColor(hexString: "#FAFAFA")
        
        scale = UIFactory.getWindowSize().width / 375
        setupUI()
        
        self.messageViewModel.delegate = self
        self.amountViewModel.delegate = self
        self.favoriteViewModel.delegate = self
        self.adBannerViewModel.delegate = self
        
        self.messageViewModel.loadData(isRefresh: true)
        self.amountViewModel.loadData(isRefresh: true)
        self.favoriteViewModel.loadData(isRefresh: true)
        self.adBannerViewModel.loadData(isRefresh: true)
    }
    
    func setupUI() {
        let button = UIFactory.createTextButton(size: 10, text: "button", textColor: .black, bgColor: .gray)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            button.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 100),
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        
        /*
        let corner = 6 * scale
        let shadowOpacity: Float = 0.8
        
        let vContainer = createView(color: .clear)
        let ivPreview = createImage(name: "")
        ivPreview.contentMode = .scaleToFill
        let vTranslucent = createView(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.16))
        vTranslucent.alpha = 0
        
        let bgSubtitle = createView(color: .black.withAlphaComponent(0.65), corner: corner)
        
        let lbSubtitle = createLabel(size: 14 * scale, text: "", color: .white, font: .RoundedMplus1c_Medium)
        lbSubtitle.numberOfLines = 0
        lbSubtitle.alpha = 0.9
        
        let lbTitle = createLabel(size: 14 * scale, text: "", color: .white, font: .RoundedMplus1c_Bold)
        lbTitle.textAlignment = .center
        lbTitle.numberOfLines = 0
        addShadow(view: lbTitle, width: 0, height: 0, shadowOpacity: shadowOpacity)
//        lbTitle.alpha = 0
        
        let ivVote = createImage(name: "eye", tintColor: .white)
        ivVote.contentMode = .scaleAspectFit
        addShadow(view: ivVote, width: 0, height: 0, shadowOpacity: shadowOpacity)
        
        let lbVote = createLabel(size: 12 * scale, text: "", color: .white, font: .RoundedMplus1c_Medium)
        lbVote.numberOfLines = 1
        addShadow(view: lbVote, width: 0, height: 0, shadowOpacity: shadowOpacity)
        
        self.vContainer = vContainer
        self.ivPreview = ivPreview
        self.vTranslucent = vTranslucent
        self.bgSubtitle = bgSubtitle
        self.lbSubtitle = lbSubtitle
        self.lbTitle = lbTitle
        self.ivVote = ivVote
        self.lbVote = lbVote
        
        contentView.addSubview(vContainer)
        vContainer.addSubview(ivPreview)
        contentView.addSubview(vTranslucent)
        contentView.addSubview(bgSubtitle)
        contentView.addSubview(lbSubtitle)
        contentView.addSubview(lbTitle)
        contentView.addSubview(ivVote)
        contentView.addSubview(lbVote)
        
        NSLayoutConstraint.activate([
            vContainer.topAnchor.constraint(equalTo: contentView.topAnchor),
            vContainer.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            vContainer.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            vContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            ivPreview.topAnchor.constraint(equalTo: vContainer.topAnchor),
            ivPreview.leftAnchor.constraint(equalTo: vContainer.leftAnchor),
            ivPreview.rightAnchor.constraint(equalTo: vContainer.rightAnchor),
            ivPreview.bottomAnchor.constraint(equalTo: vContainer.bottomAnchor),
            
            vTranslucent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            vTranslucent.heightAnchor.constraint(equalToConstant: 58 * scale),
            vTranslucent.leadingAnchor.constraint(equalTo: leadingAnchor),
            vTranslucent.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bgSubtitle.topAnchor.constraint(equalTo: lbSubtitle.topAnchor, constant: -2 * scale),
            bgSubtitle.leftAnchor.constraint(equalTo: lbSubtitle.leftAnchor, constant: -2 * scale),
            bgSubtitle.rightAnchor.constraint(equalTo: lbSubtitle.rightAnchor, constant: 2 * scale),
            bgSubtitle.bottomAnchor.constraint(equalTo: lbSubtitle.bottomAnchor, constant: 2 * scale),
            
            ivVote.centerYAnchor.constraint(equalTo: lbVote.centerYAnchor),
            ivVote.leftAnchor.constraint(equalTo: vTranslucent.leftAnchor, constant: 12 * scale),
            ivVote.widthAnchor.constraint(equalToConstant: 26 * scale),
            ivVote.heightAnchor.constraint(equalToConstant: 18 * scale),
            
            lbVote.bottomAnchor.constraint(equalTo: vTranslucent.bottomAnchor, constant: -10 * scale),
            lbVote.leftAnchor.constraint(equalTo: ivVote.rightAnchor, constant: 6 * scale),
            lbVote.rightAnchor.constraint(equalTo: vTranslucent.rightAnchor, constant: -12 * scale),
            
            lbSubtitle.bottomAnchor.constraint(equalTo: lbVote.topAnchor, constant: -10 * scale),
            lbSubtitle.leftAnchor.constraint(equalTo: vTranslucent.leftAnchor, constant: 12 * scale),
            lbSubtitle.rightAnchor.constraint(equalTo: vTranslucent.rightAnchor, constant: -12 * scale),
            
//            lbTitle.centerYAnchor.constraint(equalTo: vTranslucent.centerYAnchor),
            lbTitle.bottomAnchor.constraint(equalTo: lbSubtitle.topAnchor, constant: -10 * scale),
            lbTitle.leftAnchor.constraint(equalTo: vTranslucent.leftAnchor, constant: 12 * scale),
            lbTitle.rightAnchor.constraint(equalTo: vTranslucent.rightAnchor, constant: -12 * scale),
        ])

        setupVIPTag()
        setupNewTag()
        setupHotTag()
        setupUGCInfoView()
        setupIndicator()
        */
    }
    
}

extension HomeViewController {
    @objc func buttonTapped() {
        let vc = NotificationViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: MessageViewModelProtocol {
    func updateMessageUI() {
        let objs = messageViewModel.messages
//        for obj in objs {
//            print("obj: \(obj.message)")
//        }
        print("messages count: \(objs.count)")
    }
}

extension HomeViewController: AmountViewModelProtocol {
    func updateAmountUI() {
        let savings = amountViewModel.savings
        let fixedDeposits = amountViewModel.fixedDeposits
        let digitals = amountViewModel.digitals
        
//        for obj in savings {
//            print("obj account: \(obj.account)")
//            print("obj balance: \(obj.balance)")
//        }
        print("savings count: \(savings.count)")
        print("fixedDeposits count: \(fixedDeposits.count)")
        print("digitals count: \(digitals.count)")
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
