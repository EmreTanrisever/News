//
//  Enums.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 19.08.2022.
//

import Foundation

enum NetworkError: String, Error {
    case Bad_Request = "Bad Request" // 400
    case Unauthorized = "Unauthorized"// 401-428
    case Too_Many_Request = "Too_Many_Request"// 429
    case Server_Error = "Server_Error"// 500
    case Undefined = "Undefined"
}
