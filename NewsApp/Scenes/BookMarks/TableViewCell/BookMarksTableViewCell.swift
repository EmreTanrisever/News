//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 16.08.2022.
//

import UIKit

protocol BookMarksTableViewCellProtocol {
    func refreshTableView()
}

class BookMarksTableViewCell: UITableViewCell {

    let newsNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = 200
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.font = DesignConstant.FontSize.HEADİNG_THREE_BOLD
        return label
    }()

    let deleteButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 24, left: 24, bottom: 24, right: 24)
        return button
    }()

    private var news: News?
    private let viewModel = BookMarksViewModel()
    var delegate: BookMarksTableViewCellProtocol?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) could not been implemented.")
    }

    func setNews(news: News) {
        guard let title = news.title else {
            return
        }
        self.news = news
        newsNameLabel.text = title
    }

    @objc func deleteButtonTapped() {
        guard let news = self.news else {
            return
        }
        viewModel.deleteNews(news: news)
        delegate?.refreshTableView()
    }
}
