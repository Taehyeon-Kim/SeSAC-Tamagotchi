//
//  StoryboardManager.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/25.
//

import UIKit

enum StoryboardType: String {
    case select = "SelectViewController"
    case detail = "DetailViewController"
    case main = "MainViewController"
    case setting = "SettingViewController"
    case name = "NameViewController"
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: rawValue, bundle: nil)
    }
    
    var identifier: String {
        return rawValue
    }
}

struct StoryboardManager {
    static func instantiateViewController<T>(_ storyboardType: StoryboardType, for type: T.Type) -> T? {
        guard let viewController = storyboardType.storyboard.instantiateViewController(withIdentifier: storyboardType.identifier) as? T else {
            fatalError()
        }
        return viewController
    }
}
