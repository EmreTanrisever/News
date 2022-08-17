//
//  NetworkLayer.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Alamofire

enum CustomError: Error {
    case Error
}

final class NetworkLayer {
    static let shared = NetworkLayer()
}

extension NetworkLayer {
    func fetchNews<T: Codable>(url: String, type: T.Type, completion: @escaping(Swift.Result<T, Error>) -> Void) {
        let request = AF.request(url, encoding: JSONEncoding.default)
        request.validate().responseDecodable(of: type.self) { response in
            guard let data = response.value else {
                return
            }
            completion(.success(data))
        }
    }
}
