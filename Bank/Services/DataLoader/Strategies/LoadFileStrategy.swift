//
//  LoadFileStrategy.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation

protocol FileParams {
    var data: Data? {get set}
}

struct FileParams_message: FileParams {
    var fileName: String
    var fileExt: String
    var data: Data?
    
    var cacheKey: String {
        return "\(fileName).\(fileExt)"
    }
}
