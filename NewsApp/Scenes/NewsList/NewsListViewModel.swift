//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Foundation

class NewsListViewModel {
    private let service = NetworkService()
    var refresh: (() -> Void)?

    func getNews() {
        service.fetchNews { response in
            AppManager.shared.news = response.articles
            self.refresh?()
        }
    }

    func searchNews(text: String) {
        if !text.isEmpty {
            service.searchNews(text: text) { response in
                AppManager.shared.news = response.articles
                print(AppManager.shared.news)
            }
        } else {
            getNews()
        }
    }
}
