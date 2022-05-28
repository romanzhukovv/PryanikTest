//
//  NetworkManager.swift
//  PryanikTest
//
//  Created by Roman Zhukov on 26.05.2022.
//

import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()
    private let url = "https://pryaniky.com/static/json/sample.json"
    
    
    private init() {}
    
    func fetchData(completion: @escaping(Result<ItemsData, NetworkError>) -> Void) {
        AF.request(url)
            .validate()
            .responseJSON { dataResponce in
                guard let data = dataResponce.data else { return }
                
                do {
                    let data = try JSONDecoder().decode(ItemsData.self, from: data)
                    completion(.success(data))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
    }
    
    func fetchImage(from url: URL, completion: @escaping(Result<Data, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }.resume()
    }
}
