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
            return "저는 따끔따끔 다마고치입니다. 따끔따끔 조금 예민해요~~ 예민할 때 건드리면 확 폭주할 수도 있답니다! 덩치는 조그마하지만 힘은 아주 세다구요~!"
        case .bangsil:
            return "저는 방실방실 다마고치입니다. 저는 둥실둥실, 둥근 성격이에요. 좋은 것이 좋은거죠~!! 원만한 인간 관계를 원해요!! 우리 함께 잘 지내봐요~~"
        case .banzzak:
            return "저는 반짝반짝 다마고치입니다. 멋쟁이 토마토,, 아아 저는 멋쟁이 다마고치입니다 ㅎㅎ 꾸미는 것을 좋아하고 춤추고 노래하는 것도 좋아합니다!!"
        case .preparing:
            return nil
        }
    }
}
