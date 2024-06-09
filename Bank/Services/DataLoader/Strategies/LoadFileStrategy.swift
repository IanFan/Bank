//
//  LoadFileStrategy.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation

protocol LoadFileStrategy {
    associatedtype Params
    associatedtype ResultType
     
    func loadSingleFile(params: Params) async throws -> Result<ResultType, Error>
}

protocol FileParams {
    var data: Data? {get set}
}

// MARK: - LOADER message

struct FileParams_message: FileParams {
    var fileName: String
    var fileExt: String
    var data: Data?
    
    var cacheKey: String {
        return "\(fileName).\(fileExt)"
    }
}

class LoadFileStrategy_message: LoadFileStrategy {
    typealias Params = FileParams_message
    typealias ResultType = FileParams_message
    
    func loadSingleFile(params: Params) async throws -> Result<ResultType, Error> {
        let fileName = params.fileName
        let fileExt = params.fileExt
        
        return await withCheckedContinuation { continuation in
            let url = "\(RequestStruct.DOMAIN)/\(fileName).\(fileExt)"
            RequestManager.shared.httpGet(url: url, parameters: nil, httpClosure: { data, response, error in
                if let data = data {
                    var resultParams = params
                    resultParams.data = data
                    continuation.resume(returning: .success(resultParams))
                } else {
                    let error = NSError(domain: "RequestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Request failed or no data"])
                    continuation.resume(returning: .failure(error))
                }
            })
        }
    }
}

// MARK: - LOADER amount saving

struct FileParams_amountSaving: FileParams {
    var fileName: String
    var fileExt: String
    var data: Data?
    
    var cacheKey: String {
        return "\(fileName).\(fileExt)"
    }
}

class LoadFileStrategy_amountSaving: LoadFileStrategy {
    typealias Params = FileParams_amountSaving
    typealias ResultType = FileParams_amountSaving
    
    func loadSingleFile(params: Params) async throws -> Result<ResultType, Error> {
        let fileName = params.fileName
        let fileExt = params.fileExt
        
        return await withCheckedContinuation { continuation in
            let url = "\(RequestStruct.DOMAIN)/\(fileName).\(fileExt)"
            RequestManager.shared.httpGet(url: url, parameters: nil, httpClosure: { data, response, error in
                if let data = data {
                    var resultParams = params
                    resultParams.data = data
                    continuation.resume(returning: .success(resultParams))
                } else {
                    let error = NSError(domain: "RequestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Request failed or no data"])
                    continuation.resume(returning: .failure(error))
                }
            })
        }
    }
}

// MARK: - LOADER amount fixed deposit

struct FileParams_amountFixedDeposit: FileParams {
    var fileName: String
    var fileExt: String
    var data: Data?
    
    var cacheKey: String {
        return "\(fileName).\(fileExt)"
    }
}

class LoadFileStrategy_amountFixedDeposit: LoadFileStrategy {
    typealias Params = FileParams_amountFixedDeposit
    typealias ResultType = FileParams_amountFixedDeposit
    
    func loadSingleFile(params: Params) async throws -> Result<ResultType, Error> {
        let fileName = params.fileName
        let fileExt = params.fileExt
        
        return await withCheckedContinuation { continuation in
            let url = "\(RequestStruct.DOMAIN)/\(fileName).\(fileExt)"
            RequestManager.shared.httpGet(url: url, parameters: nil, httpClosure: { data, response, error in
                if let data = data {
                    var resultParams = params
                    resultParams.data = data
                    continuation.resume(returning: .success(resultParams))
                } else {
                    let error = NSError(domain: "RequestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Request failed or no data"])
                    continuation.resume(returning: .failure(error))
                }
            })
        }
    }
}

// MARK: - LOADER amount digital

struct FileParams_amountDigital: FileParams {
    var fileName: String
    var fileExt: String
    var data: Data?
    
    var cacheKey: String {
        return "\(fileName).\(fileExt)"
    }
}

class LoadFileStrategy_amountDigital: LoadFileStrategy {
    typealias Params = FileParams_amountDigital
    typealias ResultType = FileParams_amountDigital
    
    func loadSingleFile(params: Params) async throws -> Result<ResultType, Error> {
        let fileName = params.fileName
        let fileExt = params.fileExt
        
        return await withCheckedContinuation { continuation in
            let url = "\(RequestStruct.DOMAIN)/\(fileName).\(fileExt)"
            RequestManager.shared.httpGet(url: url, parameters: nil, httpClosure: { data, response, error in
                if let data = data {
                    var resultParams = params
                    resultParams.data = data
                    continuation.resume(returning: .success(resultParams))
                } else {
                    let error = NSError(domain: "RequestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Request failed or no data"])
                    continuation.resume(returning: .failure(error))
                }
            })
        }
    }
}

// MARK: - LOADER favorite

struct FileParams_favorite: FileParams {
    var fileName: String
    var fileExt: String
    var data: Data?
    
    var cacheKey: String {
        return "\(fileName).\(fileExt)"
    }
}

class LoadFileStrategy_favorite: LoadFileStrategy {
    typealias Params = FileParams_favorite
    typealias ResultType = FileParams_favorite
    
    func loadSingleFile(params: Params) async throws -> Result<ResultType, Error> {
        let fileName = params.fileName
        let fileExt = params.fileExt
        
        return await withCheckedContinuation { continuation in
            let url = "\(RequestStruct.DOMAIN)/\(fileName).\(fileExt)"
            RequestManager.shared.httpGet(url: url, parameters: nil, httpClosure: { data, response, error in
                if let data = data {
                    var resultParams = params
                    resultParams.data = data
                    continuation.resume(returning: .success(resultParams))
                } else {
                    let error = NSError(domain: "RequestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Request failed or no data"])
                    continuation.resume(returning: .failure(error))
                }
            })
        }
    }
}

// MARK: - LOADER adBanner

struct FileParams_adBanner: FileParams {
    var fileName: String
    var fileExt: String
    var data: Data?
    
    var cacheKey: String {
        return "\(fileName).\(fileExt)"
    }
}

class LoadFileStrategy_adBanner: LoadFileStrategy {
    typealias Params = FileParams_adBanner
    typealias ResultType = FileParams_adBanner
    
    func loadSingleFile(params: Params) async throws -> Result<ResultType, Error> {
        let fileName = params.fileName
        let fileExt = params.fileExt
        
        return await withCheckedContinuation { continuation in
            let url = "\(RequestStruct.DOMAIN)/\(fileName).\(fileExt)"
            RequestManager.shared.httpGet(url: url, parameters: nil, httpClosure: { data, response, error in
                if let data = data {
                    var resultParams = params
                    resultParams.data = data
                    continuation.resume(returning: .success(resultParams))
                } else {
                    let error = NSError(domain: "RequestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Request failed or no data"])
                    continuation.resume(returning: .failure(error))
                }
            })
        }
    }
}
