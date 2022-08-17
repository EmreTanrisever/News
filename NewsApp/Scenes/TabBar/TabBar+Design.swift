//
//  TabBar+Design.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Foundation
import UIKit

extension TabBarController {
    func configure() {
        let newsListController = UINavigationController(rootViewController: NewsListController())
        newsListController.title = "TabBar.newsName".localized
        newsListController.tabBarItem.image = UIImage(systemName: "newspaper")
        newsListController.tabBarItem.selectedImage = UIImage(systemName: "newspaper.fill")

        let bookMarksController = UINavigationController(rootViewController: BookMarksController())
        bookMarksController.title = "TabBar.bookMarksName".localized
        bookMarksController.tabBarItem.image = UIImage(systemName: "bookmark")
        bookMarksController.tabBarItem.selectedImage = UIImage(systemName: "bookmark.fill")

        setViewControllers([newsListController, bookMarksController], animated: false)
        self.modalPresentationStyle = .fullScreen
        tabBar.backgroundColor = .lightText
    }
}
