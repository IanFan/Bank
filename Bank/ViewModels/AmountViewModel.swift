//
//  AmountViewModel.swift
//  Bank
//
//  Created by Ian Fan on 2024/6/8.
//

import Foundation

protocol AmountViewModelProtocol: AnyObject {
    func updateAmountUI()
}

class AmountViewModel: NSObject {
    var delegate: AmountViewModelProtocol?
    var savings = [AmountSavingModel]()
    var fixedDeposits = [AmountFixedDepositModel]()
    var digitals = [AmountDigitalModel]()
    
    func loadData(isRefresh: Bool = false) {
        let mainGroup = DispatchGroup()
        var loadError: Error?
        
        // Load USD account data
        mainGroup.enter()
        loadAccountData(account: "usd", isRefresh: isRefresh) { result in
            if case .failure(let error) = result {
                loadError = error
            }
            mainGroup.leave()
        }
        
        // Load KHR account data
        mainGroup.enter()
        loadAccountData(account: "khr", isRefresh: isRefresh) { result in
            if case .failure(let error) = result {
                loadError = error
            }
            mainGroup.leave()
        }
        
        // Notify when all tasks are complete
        mainGroup.notify(queue: .main) {
            if let error = loadError {
//                self.delegate?.showError(error)
            } else {
                self.delegate?.updateAmountUI()
            }
        }
    }
    
    func loadAccountData(account: String, isRefresh: Bool = false, completion: @escaping (Result<Void, Error>) -> Void) {
        let group = DispatchGroup()
        var loadError: Error?
        
        // Load savings
        group.enter()
        loadSavings(account: account, isRefresh: isRefresh) { result in
            if case .failure(let error) = result {
                loadError = error
            }
            group.leave()
        }
        
        // Load fixed deposits
        group.enter()
        loadFixedDeposits(account: account, isRefresh: isRefresh) { result in
            if case .failure(let error) = result {
                loadError = error
            }
            group.leave()
        }
        
        // Load digitals
        group.enter()
        loadDigitals(account: account, isRefresh: isRefresh) { result in
            if case .failure(let error) = result {
                loadError = error
            }
            group.leave()
        }
        
        // Notify when all tasks are complete
        group.notify(queue: .main) {
            if let error = loadError {
//                self.delegate?.showAmountError(error)
            } else {
                self.delegate?.updateAmountUI()
            }
        }
    }
    
    private func loadSavings(account: String, isRefresh: Bool, completion: @escaping (Result<[AmountSavingModel], Error>) -> Void) {
        var fileName: String
        if isRefresh {
            fileName = "\(account)Savings2"
        } else {
            fileName = "\(account)Savings1"
        }
        let fileExt = "json"
        
        let params = FileParams_amountSaving(fileName: fileName, fileExt: fileExt)
        let loader = GenericSingleDataLoader(dataLoader: AmountSavingLoader())
        loader.loadData(params: params, completion: { [weak self] result in
            switch result {
            case .success(let resultParams):
                guard let objs = resultParams.result?.savingsList else {
                    DispatchQueue.main.async {
                        completion(.failure(LoadError.emptyDataError))
                    }
                    return
                }
                DispatchQueue.main.async {
                    self?.savings = objs
                    completion(.success(objs))
                }
            case .failure(let error):
                print("load error: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(LoadError.loadError))
                }
            }
        })
    }
    
    private func loadFixedDeposits(account: String, isRefresh: Bool, completion: @escaping (Result<[AmountFixedDepositModel], Error>) -> Void) {
        var fileName: String
        if isRefresh {
            fileName = "\(account)Fixed2"
        } else {
            fileName = "\(account)Fixed1"
        }
        let fileExt = "json"
        
        let params = FileParams_amountFixedDeposit(fileName: fileName, fileExt: fileExt)
        let loader = GenericSingleDataLoader(dataLoader: AmountFixedDepositLoader())
        loader.loadData(params: params, completion: { [weak self] result in
            switch result {
            case .success(let resultParams):
                guard let objs = resultParams.result?.fixedDepositList else {
                    DispatchQueue.main.async {
                        completion(.failure(LoadError.emptyDataError))
                    }
                    return
                }
                DispatchQueue.main.async {
                    self?.fixedDeposits = objs
                    completion(.success(objs))
                }
            case .failure(let error):
                print("load error: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(LoadError.loadError))
                }
            }
        })
    }
    
    private func loadDigitals(account: String, isRefresh: Bool, completion: @escaping (Result<[AmountDigitalModel], Error>) -> Void) {
        var fileName: String
        if isRefresh {
            fileName = "\(account)Digital2"
        } else {
            fileName = "\(account)Digital1"
        }
        let fileExt = "json"
        
        let params = FileParams_amountDigital(fileName: fileName, fileExt: fileExt)
        let loader = GenericSingleDataLoader(dataLoader: AmountDigitalLoader())
        loader.loadData(params: params, completion: { [weak self] result in
            switch result {
            case .success(let resultParams):
                guard let objs = resultParams.result?.digitalList else {
                    DispatchQueue.main.async {
                        completion(.failure(LoadError.emptyDataError))
                    }
                    return
                }
                DispatchQueue.main.async {
                    self?.digitals = objs
                    completion(.success(objs))
                }
            case .failure(let error):
                print("load error: \(error)")
                DispatchQueue.main.async {
                    completion(.failure(LoadError.loadError))
                }
            }
        })
    }
}
