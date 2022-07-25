//
//  TamagotchiType.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/24.
//

import UIKit

enum TamagotchiType: Int, CaseIterable {
    case ddaggeum = 1
    case bangsil = 2
    case banzzak = 3
    case preparing = 0
    
    var profileImage: UIImage? {
        switch self {
        case .ddaggeum:
            return UIImage(named: "1-6")
        case .bangsil:
            return UIImage(named: "2-6")
        case .banzzak:
            return UIImage(named: "3-6")
        case .preparing:
            return UIImage(named: "noImage")
        }
    }
    
    var name: String {
        switch self {
        case .ddaggeum:
            return "따끔따끔 다마고치"
        case .bangsil:
            return "방실방실 다마고치"
        case .banzzak:
            return "반짝반짝 다마고치"
        case .preparing:
            return "준비중이에요"
        }
    }
    
    var description: String? {
        switch self {
        case .ddaggeum:
            return "저는 따끔따끔 다마고치입니다"
        case .bangsil:
            return "저는 방실방실 다마고치입니다"
        case .banzzak:
            return "저는 반짝반짝 다마고치입니다"
        case .preparing:
            return nil
        }
    }
}
