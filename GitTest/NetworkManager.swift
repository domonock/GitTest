//
//  ServerManager.swift
//  GitTest
//
//  Created by Владимир Бабич on 31.10.2020.
//

import Foundation

public enum SortBy: String {
    case stars = "stars"
    case name = "name"
}

public enum SortOrder: String{
    case asc = "asc"
    case desc = "desc"
}

public final class NetworkManager {
    public static let shared = NetworkManager()
    private let urlString = "https://api.github.com"
    private let requestString = "/search/repositories"
    
    func getData(sortBy: SortBy, order: SortOrder, search: String, page: Int, perPage: Int, completion: @escaping (Result<Repo, NSError>) -> Void) {
        let finalUrlString =
            urlString +
            requestString +
            "?q=\(search)" +
            "&sort=\(sortBy.rawValue)" +
            "&order=\(order.rawValue)" +
            "&per_page=\(perPage)" +
            "&page=\(page)"
        
        guard let url = URL(string: finalUrlString) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let parsedObject = try JSONDecoder().decode(Repo.self, from: data)
                completion(.success(parsedObject))
            } catch {
                print(error)
                completion(.failure(error as NSError))
            }
        }.resume()
    }
}
