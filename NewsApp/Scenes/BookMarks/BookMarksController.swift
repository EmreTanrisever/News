//
//  BookMarksController.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import Kingfisher
import UIKit

class BookMarksController: UIViewController {

    lazy var bookMarksTableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = self.view.frame.height / 8
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BookMarksTableViewCell.self, forCellReuseIdentifier: "BookMarksTableViewCell")
        return tableView
    }()

    private let viewModel = BookMarksViewModel()
    private var news: [News]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = DesignConstant.Color.APP_BACKGROUND_COLOR

        title = "BookMarks.title".localized

        configure()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.news = viewModel.getNews()
        refresh()
    }

    private func refresh() {
        bookMarksTableView.reloadData()
    }
}

extension BookMarksController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let news = self.news else {
            return 0
        }
        return news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "BookMarksTableViewCell"
        ) as? BookMarksTableViewCell, let news = self.news else {
            return UITableViewCell()
        }
        cell.setNews(news: news[indexPath.row])
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let news = self.news else {
            return
        }
        guard let url = news[indexPath.row].url else {
            return
        }
        let viewController = WebViewController(url: url, title: news[indexPath.row].source.name)
        let nav = UINavigationController(rootViewController: viewController)
        present(nav, animated: true)
    }
}

extension BookMarksController: BookMarksTableViewCellProtocol {
    func refreshTableView() {
        self.news = self.viewModel.getNews()
        self.refresh()
    }
}
