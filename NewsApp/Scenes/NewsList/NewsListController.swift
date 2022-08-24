//
//  NewsListController.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 14.08.2022.
//

import UIKit

class NewsListController: UIViewController {

    lazy var newsListTableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = self.view.frame.height / 6
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: "NewsListTableViewCell")
//        tableView.separatorColor = DesignConstant.Color.LIGHT_BLUE
//        tableView.separatorInset = .zero
         tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        return tableView
    }()

    let searchController = UISearchController(searchResultsController: nil)

    private let viewModel = NewsListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = DesignConstant.Color.APP_BACKGROUND_COLOR
        title = "NewsList.title".localized
        navigationController?.navigationBar.prefersLargeTitles = true

        searchController.searchResultsUpdater = self
        searchController.delegate = self
        navigationItem.searchController = searchController

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Filter",
            style: .plain,
            target: self,
            action: #selector(rightBarTapped)
        )

        configure()

        viewModel.refresh = {
            self.refresh()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getNews()
    }

    @objc private func rightBarTapped() {
    }

    @objc private func didPullToRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.newsListTableView.refreshControl?.endRefreshing()
        }
        viewModel.getNews()
        self.refresh()
    }

    private func refresh() {
        newsListTableView.reloadData()
    }
}

extension NewsListController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppManager.shared.news.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "NewsListTableViewCell"
        ) as? NewsListTableViewCell else {
            return UITableViewCell()
        }
        cell.setNews(news: AppManager.shared.news[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = NewsDetailViewController()
        controller.setNews(news: AppManager.shared.news[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension NewsListController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        viewModel.searchNews(text: text.lowercased())
        DispatchQueue.main.async {
            self.newsListTableView.reloadData()
        }
    }
}
