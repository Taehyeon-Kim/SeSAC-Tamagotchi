//
//  UserDefaultManager.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/25.
//

import Foundation

@propertyWrapper
struct UserDefaultWrapper<T> {
    private let key: String
    private let defaultValue: T
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
}

enum UserDefaultKey: String {
    case isAppFirstLaunch
    case nickname
    case characterName
    case level
    case rice
    case waterdrop
}

struct UserDefaultManager {
    @UserDefaultWrapper(key: UserDefaultKey.isAppFirstLaunch.rawValue, defaultValue: true)
    static var isAppFirstLaunch: Bool
    
    @UserDefaultWrapper(key: UserDefaultKey.nickname.rawValue, defaultValue: "대장")
    static var nickname: String
    
    @UserDefaultWrapper(key: UserDefaultKey.characterName.rawValue, defaultValue: "")
    static var characterName: String
    
    @UserDefaultWrapper(key: UserDefaultKey.level.rawValue, defaultValue: 1)
    static var level: Int
    
    @UserDefaultWrapper(key: UserDefaultKey.rice.rawValue, defaultValue: 0)
    static var rice: Double
    
    @UserDefaultWrapper(key: UserDefaultKey.waterdrop.rawValue, defaultValue: 0)
    static var waterdrop: Double
}
