//
//  MessageModel.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation

struct MessageResponseModel: Codable {
    let msgCode: String
    let msgContent: String
    let result: MessageResultModel?
}

struct MessageResultModel: Codable {
    let messages: [MessageModel]?
}

struct MessageModel: Codable {
    let status: Bool
    let updateDateTime: String
    let title: String
    let message: String
    
    var updateDateTimeDouble: Double? {
        if let double = DateHelper.string2TimeInterval(updateDateTime) {
            return double
        } else {
            return nil
        }
    }
}


