//
//  TableViewCell.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Kingfisher
import UIKit

final class NewsListTableViewCell: UITableViewCell {

    let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 8
        return imageView
    }()

    let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = 200
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.font = DesignConstant.FontSize.HEADİNG_THREE_BOLD
        return label
    }()

    let newsSourceTitle: UILabel = {
        let label = UILabel()
        label.layer.borderWidth = 2
        label.layer.borderColor = DesignConstant.Color.LIGHT_BLUE.cgColor
        label.layer.cornerRadius = 8
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }

    func setNews(news: News) {
        guard let image = news.image,
              let newsTitle = news.title else {
            return
        }

        newsImageView.kf.setImage(with: URL(string: image))
        newsTitleLabel.text = newsTitle
        newsSourceTitle.text = "  \(news.source.name)  "
    }
}
