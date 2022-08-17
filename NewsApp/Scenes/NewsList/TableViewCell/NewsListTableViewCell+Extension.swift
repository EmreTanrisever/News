//
//  NewsListTableViewCell+Extension.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Foundation
import SnapKit

extension NewsListTableViewCell {
    func configure() {
        addSubview(newsImageView)
        addSubview(newsTitleLabel)
        addSubview(newsSourceTitle)

        setNewsImageViewConstraints()
        setNewsTitleLabelConstraints()
        setNewsSourceTitleConstraints()
    }

    private func setNewsSourceTitleConstraints() {
        newsSourceTitle.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-8)
            make.trailing.equalToSuperview().offset(-8)
            make.height.equalTo(24)
        }
    }

    private func setNewsTitleLabelConstraints() {
        newsTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(newsImageView.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
    }

    private func setNewsImageViewConstraints() {
        newsImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.leading.equalToSuperview().offset(16)
            make.width.equalTo(150)
        }
    }
}
