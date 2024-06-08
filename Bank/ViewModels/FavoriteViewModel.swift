//
//  FavoriteViewModel.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation

protocol FavoriteViewModelProtocol: AnyObject {
    func updateFavoriteUI()
}

class FavoriteViewModel: NSObject {
    var delegate: FavoriteViewModelProtocol?
    var favorites = [FavoriteModel]()
    
    func loadData(isRefresh: Bool = false) {
        loadData(isRefresh: isRefresh, completion: { result in
            self.delegate?.updateFavoriteUI()
        })
    }
    
    func loadData(isRefresh: Bool = false, completion: @escaping (Result<[FavoriteModel], Error>) -> Void) {
        
        var fileName: String
        if isRefresh {
            fileName = "favoriteList"
        } else {
            fileName = "emptyFavoriteList"
        }
        let fileExt = "json"
        
        let params = FileParams_favorite(fileName: fileName, fileExt: fileExt)
        let loader = GenericSingleDataLoader(dataLoader: FavoriteLoader())
        loader.loadData(params: params, completion: { [weak self] result in
            switch result {
            case .success(let resultParams):
                guard let objs = resultParams.result?.favoriteList, let sortedObjs = self?.sortFavoriteObjs(objs: objs) else {
                    DispatchQueue.main.async {
                        completion(.failure(LoadError.emptyDataError))
                    }
                    return
                }
                DispatchQueue.main.async {
                    self?.favorites = sortedObjs
                    completion(.success(sortedObjs))
                }
            case .failure(let error):
                print("load error: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(LoadError.loadError))
                }
            }
        })
    }
    
    private func sortFavoriteObjs(objs: [FavoriteModel]) -> [FavoriteModel] {
        var objs = objs
//        objs.sort {
//            return ($0.adSeqNo) < ($1.adSeqNo)
//        }
        return objs
    }
}
