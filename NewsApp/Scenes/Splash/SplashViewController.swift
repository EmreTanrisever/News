//
//  ViewController.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 13.08.2022.
//

import UIKit

final class SplashViewController: UIViewController {

    let appNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Splash.AppName".localized
        label.textColor = DesignConstant.Color.BLACK
        label.font = DesignConstant.FontSize.HEADİNG_ONE_BOLD
        return label
    }()

    let myNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Splash.MyName".localized
        label.textColor = DesignConstant.Color.LIGHT_GRAY
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
}
