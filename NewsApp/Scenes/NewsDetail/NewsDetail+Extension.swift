//
//  BookMarks+Extension.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Foundation

extension NewsDetailViewController {
    func configure() {
        self.view.addSubview(saveButton)
        self.view.addSubview(deleteButton)
        self.view.addSubview(newsImageView)
        self.view.addSubview(newsTitleLabel)
        self.view.addSubview(newsContentLabel)
        self.view.addSubview(newsSourceNameLabel)

        setSaveButtonConstraints()
        setDeleteButtonConstraints()
        setNewsImageViewContraints()
        setNewsTitleLabelConstraints()
        setNewsContentLabelConstraints()
        setNewsSourceNameLabelConstraints()
    }

    private func setNewsContentLabelConstraints() {
        newsContentLabel.snp.makeConstraints { make in
            make.top.equalTo(newsTitleLabel.snp.bottom).offset(-32)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }

    private func setNewsTitleLabelConstraints() {
        newsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }

    private func setNewsImageViewContraints() {
        newsImageView.snp.makeConstraints { make in
            make.top.equalTo(newsSourceNameLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(self.view.frame.height / 4)
        }
    }

    private func setNewsSourceNameLabelConstraints() {
        newsSourceNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(-32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
    }

    private func setDeleteButtonConstraints() {
        deleteButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
    }

    private func setSaveButtonConstraints() {
        saveButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
    }
}
