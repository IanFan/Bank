//
//  MessageViewModel.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation

protocol MessageViewModelProtocol: AnyObject {
    func updateMessageUI()
}

class MessageViewModel: NSObject {
    var delegate: MessageViewModelProtocol?
    var messages = [MessageModel]()
    
    func loadMessageData(isRefresh: Bool = false) {
        loadMessageData(isRefresh: isRefresh, completion: { result in
            self.delegate?.updateMessageUI()
        })
    }
    
    func loadMessageData(isRefresh: Bool = false, completion: @escaping (Result<[MessageModel], Error>) -> Void) {
        
        var fileName: String
        if isRefresh {
            fileName = "notificationList"
        } else {
            fileName = "emptyNotificationList"
        }
        let fileExt = "json"
        
        let params = FileParams_message(fileName: fileName, fileExt: fileExt)
        let loader = GenericSingleDataLoader(dataLoader: MessageLoader())
        loader.loadData(params: params, completion: { [weak self] result in
            switch result {
            case .success(let resultParams):
                guard let messages = resultParams.result?.messages, let sortedMessages = self?.sortMessageObjs(objs: messages) else {
                    DispatchQueue.main.async {
                        completion(.failure(LoadError.emptyDataError))
                    }
                    return
                }
                DispatchQueue.main.async {
                    self?.messages = messages
                    completion(.success(sortedMessages))
                }
            case .failure(let error):
                print("load error: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(LoadError.loadError))
                }
            }
        })
    }
    
    private func sortMessageObjs(objs: [MessageModel]) -> [MessageModel] {
        var objs = objs
        objs.sort {
            return ($0.updateDateTimeInterval ?? 0) > ($1.updateDateTimeInterval ?? 0)
        }
        return objs
    }
}
