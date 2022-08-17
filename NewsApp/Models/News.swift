//
//  News.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Foundation

struct News: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let image: String?
    let publishedAt: String?
    let content: String?
    var bookmarks = false

    enum CodingKeys: String, CodingKey {
        case source, author, title, description, url
        case image = "urlToImage"
        case publishedAt, content
    }
}
