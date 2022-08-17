//
//  NewsDetailViewModel.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 16.08.2022.
//

import Foundation

final class NewsDetailViewModel {
    private let userDefaultsManager = UserDefaultsManager()
    var save: (() -> Void)?
    var notSave: (() -> Void)?

    func saveNews(news: News) {
        let savedNews = userDefaultsManager.readNews()
        var isItThere = false
        for item in savedNews where item.title == news.title {
            isItThere = true
            return
        }
        if !isItThere {
            userDefaultsManager.saveNews(news: news)
        }
    }

    func isItSaved(news: News?) {
        guard let news = news else {
            return
        }
        let savedNews = userDefaultsManager.readNews()
        var isItThere = false
        for item in savedNews where item.title == news.title {
            isItThere = true
            notSave?()
            return
        }
        if !isItThere {
            save?()
        }
    }

    func deleteNews(news: News) {
        userDefaultsManager.deleteNews(news: news)
    }
}
