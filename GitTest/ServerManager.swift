//
//  ServerManager.swift
//  GitTest
//
//  Created by Владимир Бабич on 31.10.2020.
//

import Foundation
enum Stars:String{
    case asc = "&sort=stars&order=asc"
    case desc = "&sort=stars&order=desc"
}
public final class ServerManager{
    public static let shared = ServerManager()
    private let urlString = "https://api.github.com"
    private let requestString = "/search/repositories"

    func getData(stars:Stars, search:String, repoCount:Int, completion: @escaping (Result<Repo, NSError>) -> Void) {
        let finalUrlString = urlString + requestString + "?q=\(search)" + stars.rawValue + "&per_page=\(repoCount)"
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
