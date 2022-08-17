//
//  DesignConstant.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 13.08.2022.
//

import Foundation
import UIKit

struct DesignConstant {
    struct Color {
        static let APP_BACKGROUND_COLOR = UIColor.white
        static let LIGHT_GRAY = UIColor.lightGray
        static let BLACK = UIColor.black
        static let LIGHT_BLUE = UIColor.systemBlue
        static let RED = UIColor.systemRed
    }
    struct Font {
    }
    struct FontSize {
        static let HEADİNG_ONE_BOLD = UIFont.systemFont(ofSize: 24, weight: .semibold)
        static let HEADİNG_TWO_BOLD = UIFont.systemFont(ofSize: 20, weight: .semibold)
        static let HEADİNG_THREE_BOLD = UIFont.systemFont(ofSize: 16, weight: .semibold)

        static let HEADİNG_ONE_LIGHT = UIFont.systemFont(ofSize: 24, weight: .light)
        static let HEADİNG_TWO_LIGHT = UIFont.systemFont(ofSize: 20, weight: .light)
        static let HEADİNG_THREE_LIGHT = UIFont.systemFont(ofSize: 16, weight: .light)

        static let HEADİNG_ONE_REGULAR = UIFont.systemFont(ofSize: 24, weight: .regular)
        static let HEADİNG_TWO_REGULAR = UIFont.systemFont(ofSize: 20, weight: .regular)
        static let HEADİNG_THREE_REGULAR = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
}
