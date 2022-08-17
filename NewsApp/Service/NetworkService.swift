//
//  NetworkService.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import AVFoundation

protocol NetworkServiceProtocol {
    func getNews(url: String, completion: @escaping(NewsResponse) -> Void)
//    func getNews(url: String)
}

final class NetworkService: NetworkServiceProtocol {
    func getNews(url: String, completion: @escaping (NewsResponse) -> Void) {
        NetworkLayer.shared.fetchNews(url: url, type: NewsResponse.self) { response in
            switch response {
            case .success(let news):
                completion(news)

            case .failure(let error):
                print(error)
            }
        }
    }
}
