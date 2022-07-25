//
//  SettingOptionType.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/25.
//

import UIKit

enum SettingOptionType: Int, CaseIterable {
    case name, tamagotchi, data
    
    var image: UIImage? {
        switch self {
        case .name:
            return UIImage(systemName: "pencil")
        case .tamagotchi:
            return UIImage(systemName: "moon.fill")
        case .data:
            return UIImage(systemName: "arrow.clockwise")
        }
    }
    
    var title: String {
        switch self {
        case .name:
            return "내 이름 설정하기"
        case .tamagotchi:
            return "다마고치 변경하기"
        case .data:
            return "데이터 초기화"
        }
    }
    
    var detail: String? {
        switch self {
        case .name:
            return UserDefaultManager.nickname
        case .tamagotchi, .data:
            return nil
        }
    }
}
