//
//  UserDefaultsManager.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 16.08.2022.
//

import Foundation

final class UserDefaultsManager {
    private let userDefaults = UserDefaults.standard
    private let key = "News"

    func saveNews(news: News) {
        var savedNews = readNews()
        savedNews.append(news)
        if let newsArray = try? JSONEncoder().encode(savedNews) {
            userDefaults.set(newsArray, forKey: key)
        }
    }

    func readNews() -> [News] {
        guard let data = userDefaults.data(forKey: key),
              let savedItems = try? JSONDecoder().decode([News].self, from: data) else {
                  return [News]()
        }
        return savedItems
    }

    func deleteNews(news: News) {
        var savedNews = readNews()
        var index = 0
        for i in 0..<savedNews.count where news.title == savedNews[i].title {
            index = i
            break
        }
        savedNews.remove(at: index)
        saveNewsAsAnArray(news: savedNews)
    }

    func saveNewsAsAnArray(news: [News]) {
        if let newsArray = try? JSONEncoder().encode(news) {
            userDefaults.set(newsArray, forKey: key)
        }
    }
}
