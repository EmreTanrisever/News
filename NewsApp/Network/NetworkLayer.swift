//
//  NetworkLayer.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Alamofire

final class NetworkLayer {
    static let shared = NetworkLayer()
}

extension NetworkLayer {
    func sendRequest<T: Codable>(
        url: String,
        type: T.Type,
        completion: @escaping(Swift.Result<T, NetworkError>
        ) -> Void
    ) {
        let request = AF.request(url, encoding: JSONEncoding.default)
        request.validate().responseDecodable(of: type.self) { response in
            guard let data = response.value else {
                if let errorStatusCode = response.response?.statusCode {
                    switch errorStatusCode {
                    case 400:
                        completion(.failure(.Bad_Request))

                    case 401...428:
                        completion(.failure(.Unauthorized))

                    case 429:
                        completion(.failure(.Too_Many_Request))

                    case 500:
                        completion(.failure(.Server_Error))

                    default:
                        completion(.failure(.Undefined))
                    }
                }
                return
            }
            completion(.success(data))
        }
    }
}
