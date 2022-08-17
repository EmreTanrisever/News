//
//  BookMarksTableViewCell+Extension.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 16.08.2022.
//

import Foundation

extension BookMarksTableViewCell {
    func configure() {
        addSubview(newsNameLabel)
        contentView.addSubview(deleteButton)

        setNewsNameLabelConstraints()
        setDeleteButtonConstraints()
    }

    private func setDeleteButtonConstraints() {
        deleteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-16)
        }
    }

    private func setNewsNameLabelConstraints() {
        newsNameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}
