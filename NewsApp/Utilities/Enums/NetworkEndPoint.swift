//
//  NetworkEndPoint.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 24.08.2022.
//

import Foundation

enum NetworkEndPoint: String {
    case BASE_URL = "https://newsapi.org/v2/"
    case EVERYTİNG = "everything?"
    case SEARCH = "q="
    case DATE = "&from=2022-07-24&sortBy=publishedAt&"
    case API_KEY = "apiKey=654d66b12eb44788ae59a8c540512861"
    case TOP_HEADLİNES = "top-headlines?"
    case COUNTRY = "country=us&"

    static func NewsEndPoint() -> String {
        let url = "\(NetworkEndPoint.BASE_URL.rawValue)" +
            "\(NetworkEndPoint.TOP_HEADLİNES.rawValue)" +
            "\(NetworkEndPoint.COUNTRY.rawValue)" +
            "\(NetworkEndPoint.API_KEY.rawValue)"
        return url
    }

    static func NewsSearchEndPoint(keyWord: String) -> String {
        let url = "\(NetworkEndPoint.BASE_URL.rawValue)" +
        "\(NetworkEndPoint.EVERYTİNG.rawValue)" +
        "\(NetworkEndPoint.SEARCH.rawValue)" + keyWord +
        "\(NetworkEndPoint.DATE.rawValue)" +
        "\(NetworkEndPoint.API_KEY.rawValue)"
        return url
    }
}
