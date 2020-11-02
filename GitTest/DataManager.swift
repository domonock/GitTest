//
//  DataManager.swift
//  GitTest
//
//  Created by Владимир Бабич on 02.11.2020.
//

import Foundation

public final class DataManager {
    public static let shared = DataManager()
    
    private let perPage = 15
    private let order: SortOrder = .desc
    private let sort: SortBy = .stars
    private let numberOfThreads = 2
    
    func search(_ string: String, completion: @escaping (Result<[Item], NSError>) -> Void) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            var resultDict = [Int: [Item]]()
            let dGroup = DispatchGroup()
            var nsError: NSError?
            for i in (0..<self.numberOfThreads) {
                dGroup.enter()
                NetworkManager.shared.getData(sortBy: self.sort, order: self.order, search: string, page: i, perPage: self.perPage) { (result) in
                    if case .success(let repo) = result, let items = repo.items {
                        resultDict[i] = items
                    }
                    else if case .failure(let error) = result {
                        nsError = error
                    }
                    dGroup.leave()
                }
            }
            dGroup.notify(queue: .global()) {
                var resultItems = [Item]()
                for i in (0..<self.numberOfThreads) {
                    if let items = resultDict[i] {
                        resultItems += items
                    }
                }
                DispatchQueue.main.async {
                    if resultItems.count == 0, let error = nsError {
                        completion(.failure(error))
                    }
                    else {
                        completion(.success(resultItems))
                    }
                }
            }
        }
    }
}
