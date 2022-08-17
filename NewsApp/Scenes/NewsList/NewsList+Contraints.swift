//
//  NewsList+Contraints.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Foundation
import SnapKit

extension NewsListController {
    func configure() {
        self.view.addSubview(newsListTableView)

        setNewsListTableViewContraints()
    }

    private func setNewsListTableViewContraints() {
        newsListTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
