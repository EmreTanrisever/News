//
//  Extension.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 13.08.2022.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
