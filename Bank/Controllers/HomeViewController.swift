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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    deinit {
        print("HomeViewController Deinit")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hexString: "#FAFAFA")
        
        scale = getWindowSize_pbn10().width / 375
        setupUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.messageViewModel.delegate = self
            self.messageViewModel.loadMessageData(isRefresh: true)
        }
    }
    
    func setupUI() {
        /*
        let corner = 6 * scale
        let shadowOpacity: Float = 0.8
        
        let vContainer = createView_pbn10(color: .clear)
        let ivPreview = createImage_pbn10(name: "")
        ivPreview.contentMode = .scaleToFill
        let vTranslucent = createView_pbn10(color: UIColor(red: 0, green: 0, blue: 0, alpha: 0.16))
        vTranslucent.alpha = 0
        
        let bgSubtitle = createView_pbn10(color: .black.withAlphaComponent(0.65), corner: corner)
        
        let lbSubtitle = createLabel_pbn10(size: 14 * scale, text: "", color: .white, font: .RoundedMplus1c_Medium)
        lbSubtitle.numberOfLines = 0
        lbSubtitle.alpha = 0.9
        
        let lbTitle = createLabel_pbn10(size: 14 * scale, text: "", color: .white, font: .RoundedMplus1c_Bold)
        lbTitle.textAlignment = .center
        lbTitle.numberOfLines = 0
        addShadow_pbn10(view: lbTitle, width: 0, height: 0, shadowOpacity: shadowOpacity)
//        lbTitle.alpha = 0
        
        let ivVote = createImage_pbn10(name: "eye", tintColor: .white)
        ivVote.contentMode = .scaleAspectFit
        addShadow_pbn10(view: ivVote, width: 0, height: 0, shadowOpacity: shadowOpacity)
        
        let lbVote = createLabel_pbn10(size: 12 * scale, text: "", color: .white, font: .RoundedMplus1c_Medium)
        lbVote.numberOfLines = 1
        addShadow_pbn10(view: lbVote, width: 0, height: 0, shadowOpacity: shadowOpacity)
        
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

extension HomeViewController: MessageViewModelProtocol {
    func updateMessageUI() {
        let messages = messageViewModel.messages
        for message in messages {
            print("message: \(message.message)")
        }
        print("message count: \(messages)")
    }
}
