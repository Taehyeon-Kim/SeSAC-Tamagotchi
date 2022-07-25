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
            guard let rootViewController = UIStoryboard(name: "SelectViewController", bundle: nil).instantiateViewController(withIdentifier: "SelectViewController") as? SelectViewController else { return }
            self.window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        } else {
            guard let rootViewController = UIStoryboard(name: "MainViewController", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
            self.window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        }
        
        self.window?.makeKeyAndVisible()
    }
}

