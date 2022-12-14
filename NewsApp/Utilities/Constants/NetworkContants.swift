//
//  NetworkContants.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Foundation

struct NetworkConstants {
    static let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=654d66b12eb44788ae59a8c540512861"
    static let BASE_URL = "https://newsapi.org/v2/"
    static let EVERTİNG = "everything?"
    static let SEARCH = "q="
    static let DATE = "&from=2022-07-24&sortBy=publishedAt&"
    static let API_KEY = "apiKey=654d66b12eb44788ae59a8c540512861"
    static let TOP_HEADLİNES = "top-headlines?"
    static let COUNTRY = "country=us&"

    static let API_KEYS = [
        "654d66b12eb44788ae59a8c540512861",
        "fb00c83b07174501a36764e212838d77",
        "2f68410cc5f7405bb6b49d409ce9c489"
    ]
}
