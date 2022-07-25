//
//  SelectSceneState.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/25.
//

import Foundation

enum SelectSceneState {
    case select, change
}

extension SelectSceneState {
    var title: String {
        switch self {
        case .select:
            return "다마고치 선택하기"
        case .change:
            return "다마고치 변경하기"
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .select:
            return "시작하기"
        case .change:
            return "변경하기"
        }
    }
}
