//
//  BookMarks+Extension.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 16.08.2022.
//

import Foundation
import SnapKit

extension BookMarksController {
    func configure() {
        self.view.addSubview(bookMarksTableView)

        setBookMarksTableViewConstraints()
    }

    private func setBookMarksTableViewConstraints() {
        bookMarksTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
