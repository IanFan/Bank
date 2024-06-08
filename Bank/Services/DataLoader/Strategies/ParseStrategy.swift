//
//  ParseStrategy.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation

protocol DataParseParams {
    var data: Data { get }
}

protocol ParseStrategy {
    associatedtype ResultType
    associatedtype DataParseParams
    func parseParams(params: DataParseParams) -> ResultType?
}

// MARK: - PARSER Message
struct DataParseParams_message: DataParseParams {
    var data: Data
}

class ParseStrategy_message: ParseStrategy {
    typealias DataParseParams = DataParseParams_message
    typealias ResultType = MessageResponseModel
    
    func parseParams(params: DataParseParams_message) -> MessageResponseModel? {
        let data = params.data
        
        let parser = MessageParser()
        let result = parser.parse(data: data)
        
        switch result {
        case .success(let response):
            return response
        case .failure(let failure):
            return nil
        }
    }
}
