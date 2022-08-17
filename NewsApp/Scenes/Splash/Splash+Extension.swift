//
//  SplashExtension.swift
//  NewsApp
//
//  Created by Emre Tanrısever on 13.08.2022.
//

import Foundation
import SnapKit
import UserNotifications

extension SplashViewController {
    func configure() {
        self.view.backgroundColor = DesignConstant.Color.APP_BACKGROUND_COLOR

        self.view.addSubview(appNameLabel)
        self.view.addSubview(myNameLabel)

        setAppNameLabelConstraints()
        setMyNameLabelConstraints()
        notificationPermission()
    }

    private func setMyNameLabelConstraints() {
        myNameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-8)
            make.trailing.equalToSuperview().offset(-16)
        }
    }

    private func setAppNameLabelConstraints() {
        appNameLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }

    private func notificationPermission() {
        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.sound, .alert, .badge]) { _, error in
                if error == nil {
                    DispatchQueue.main.async {
                        UIApplication.shared.registerForRemoteNotifications()
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.view.window?.rootViewController = TabBarController()
                    }
                }
            }
        } else {
           UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(
               types: [.sound, .alert, .badge],
               categories: nil)
           )
           UIApplication.shared.registerForRemoteNotifications()
       }
    }
}
