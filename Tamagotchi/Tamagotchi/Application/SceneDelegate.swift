//
//  SceneDelegate.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        
        if UserDefaultManager.isAppFirstLaunch {
            guard let rootViewController = StoryboardManager.instantiateViewController(.select, for: SelectViewController.self) else { return }
            self.window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        } else {
            guard let rootViewController = StoryboardManager.instantiateViewController(.main, for: MainViewController.self) else { return }
            self.window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        }
        
        self.window?.makeKeyAndVisible()
    }
}

