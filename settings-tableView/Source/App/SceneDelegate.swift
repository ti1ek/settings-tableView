//
//  SceneDelegate.swift
//  settings-tableView
//
//  Created by Zhuldyz Bukeshova on 23.03.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowsScene)
        let settingsViewController = SettingsController()
        let navigationController = UINavigationController(rootViewController: settingsViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
