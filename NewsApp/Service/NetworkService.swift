//
//  NetworkService.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import AVFoundation

protocol NetworkServiceProtocol {
    func fetchNews(completion: @escaping(NewsResponse) -> Void)
    func searchNews(text: String, completion: @escaping(NewsResponse) -> Void)
    func filterNews(to: String, from: String, completion: @escaping(NewsResponse) -> Void)
}

final class NetworkService: NetworkServiceProtocol {

    func fetchNews(completion: @escaping (NewsResponse) -> Void) {
        NetworkLayer.shared.sendRequest(
            url: NetworkEndPoint.NewsEndPoint(),
            type: NewsResponse.self
        ) { response in
            switch response {
            case .success(let news):
                completion(news)

            case .failure(let error):
                print(error)
            }
        }
    }

    func searchNews(text: String, completion: @escaping(NewsResponse) -> Void) {
        NetworkLayer.shared.sendRequest(
            url: NetworkEndPoint.NewsSearchEndPoint(keyWord: text),
            type: NewsResponse.self
        ) { response in
            switch response {
            case .success(let news):
                completion(news)

            case .failure(let error):
                print(error)
            }
        }
    }

    func filterNews(to: String, from: String, completion: @escaping(NewsResponse) -> Void) {
        print("Loading...")
    }
}
