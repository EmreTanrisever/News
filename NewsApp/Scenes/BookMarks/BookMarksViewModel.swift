//
//  BookMarksViewModel.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 16.08.2022.
//

import Foundation

final class BookMarksViewModel {
    private let userDefaultsManager = UserDefaultsManager()

    func getNews() -> [News] {
        userDefaultsManager.readNews()
    }

    func deleteNews(news: News) {
        userDefaultsManager.deleteNews(news: news)
    }
}
