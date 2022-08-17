//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 16.08.2022.
//

import UIKit

final class NewsDetailViewController: UIViewController {

    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add To BookMarks", for: .normal)
        button.backgroundColor = DesignConstant.Color.LIGHT_BLUE
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
    }()

    let deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("Delete From BookMarks", for: .normal)
        button.backgroundColor = DesignConstant.Color.RED
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        return button
    }()

    let newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()

    let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = 200
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.font = DesignConstant.FontSize.HEADİNG_TWO_BOLD
        label.textColor = DesignConstant.Color.LIGHT_BLUE
        return label
    }()

    let newsContentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.preferredMaxLayoutWidth = 200
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.font = DesignConstant.FontSize.HEADİNG_THREE_LIGHT
        return label
    }()

    let newsSourceNameLabel: UILabel = {
        let label = UILabel()
        label.layer.borderColor = DesignConstant.Color.LIGHT_BLUE.cgColor
        label.font = DesignConstant.FontSize.HEADİNG_TWO_REGULAR
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 8
        label.textColor = DesignConstant.Color.LIGHT_BLUE
        label.textAlignment = NSTextAlignment.center
        return label
    }()

    private var news: News?
    private let viewModel = NewsDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white

        viewModel.save = {
            self.deleteButton.isHidden = true
            self.saveButton.isHidden = false
        }

        viewModel.notSave = {
            self.deleteButton.isHidden = false
            self.saveButton.isHidden = true
        }

        configure()
        deleteButton.isHidden = true

        viewModel.isItSaved(news: news)

        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }

    @objc private func saveButtonTapped() {
        saveButton.isHidden = true
        deleteButton.isHidden = false
        guard let news = self.news else {
            return
        }
        viewModel.saveNews(news: news)
    }

    @objc private func deleteButtonTapped() {
        deleteButton.isHidden = true
        saveButton.isHidden = false
        guard let news = self.news else {
            return
        }
        viewModel.deleteNews(news: news)
    }

    func setNews(news: News) {
        guard let image = news.image,
              let title = news.title,
              let content = news.content else {
            return
        }
        newsImageView.kf.setImage(with: URL(string: image))
        newsTitleLabel.text = title
        newsContentLabel.text = content
        newsSourceNameLabel.text = "  \(news.source.name)  "
        self.news = news
    }
}
