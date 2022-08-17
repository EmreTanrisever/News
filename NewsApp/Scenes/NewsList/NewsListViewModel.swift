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
        let url = NetworkConstants.url
        service.getNews(url: url) { response in
            AppManager.shared.news = response.articles
            self.refresh?()
        }
    }

    func searchNews(text: String) {
        let url = NetworkConstants.BASE_URL +
        NetworkConstants.EVERTİNG +
        NetworkConstants.SEARCH + text +
        NetworkConstants.DATE +
        NetworkConstants.API_KEY

        service.getNews(url: url) { response in
            AppManager.shared.news = response.articles
        }
    }
}
