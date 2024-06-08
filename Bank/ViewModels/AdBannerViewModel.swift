//
//  AdBannerViewModel.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation

protocol AdBannerViewModelProtocol: AnyObject {
    func updateAdBannerUI()
}

class AdBannerViewModel: NSObject {
    var delegate: AdBannerViewModelProtocol?
    var adBanners = [AdBannerModel]()
    
    func loadData(isRefresh: Bool = false) {
        loadData(isRefresh: isRefresh, completion: { result in
            self.delegate?.updateAdBannerUI()
        })
    }
    
    func loadData(isRefresh: Bool = false, completion: @escaping (Result<[AdBannerModel], Error>) -> Void) {
        
        var fileName: String
        if isRefresh {
            fileName = "banner"
        } else {
            fileName = "banner"
        }
        let fileExt = "json"
        
        let params = FileParams_adBanner(fileName: fileName, fileExt: fileExt)
        let loader = GenericSingleDataLoader(dataLoader: AdBannerLoader())
        loader.loadData(params: params, completion: { [weak self] result in
            switch result {
            case .success(let resultParams):
                guard let objs = resultParams.result?.bannerList, let sortedObjs = self?.sortAdBannerObjs(objs: objs) else {
                    DispatchQueue.main.async {
                        completion(.failure(LoadError.emptyDataError))
                    }
                    return
                }
                DispatchQueue.main.async {
                    self?.adBanners = sortedObjs
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
    
    private func sortAdBannerObjs(objs: [AdBannerModel]) -> [AdBannerModel] {
        var objs = objs
        objs.sort {
            return ($0.adSeqNo) < ($1.adSeqNo)
        }
        return objs
    }
}
