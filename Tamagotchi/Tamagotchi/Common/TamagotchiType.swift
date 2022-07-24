//
//  TamagotchiType.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/24.
//

import UIKit

enum TamagotchiType: CaseIterable {
    case ddaggeum
    case bangsil
    case banzzak
    case preparing
    
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
}