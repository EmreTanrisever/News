//
//  WekViewController.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 16.08.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    private let webView: WKWebView = {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        let webView = WKWebView(frame: .zero, configuration: configuration)
        return webView
    }()

    private let url: String

    init(url: String, title: String) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
        self.title = title
    }

    required init?(coder: NSCoder) {
        fatalError("Error")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(webView)
        view.backgroundColor = DesignConstant.Color.APP_BACKGROUND_COLOR
        guard let url = URL(string: url ) else {
            return
        }
        webView.load(URLRequest(url: url))
        configureButtons()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }

    private func configureButtons() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(didTapDone)
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(didTapRefresh)
        )
    }

    @objc func didTapDone() {
        dismiss(animated: true, completion: nil)
    }

    @objc func didTapRefresh() {
        guard let url = URL(string: url) else {
            return
        }
        webView.load(URLRequest(url: url))
    }
}
