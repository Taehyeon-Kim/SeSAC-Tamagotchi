//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

struct Tamagotchi {
    var type: TamagotchiType
    var name: String { return type.name }
    var rice: Double = 0
    var waterDrop: Double = 0
    var message: String?
    var description: String? { return type.description }
}

extension Tamagotchi {
    static func getLevel(rice: Double, waterDrop: Double) -> Int {
        let total = (rice / 5) + (waterDrop / 2)
        
        if 0 <= total && total < 20 {
            return 1
        } else if 20 <= total && total < 30  {
            return 2
        } else if 30 <= total && total < 40  {
            return 3
        } else if 40 <= total && total < 50  {
            return 4
        } else if 50 <= total && total < 60  {
            return 5
        } else if 60 <= total && total < 70  {
            return 6
        } else if 70 <= total && total < 80  {
            return 7
        } else if 80 <= total && total < 90  {
            return 8
        } else if 90 <= total && total < 100  {
            return 9
        } else if 100 <= total {
            return 10
        } else {
            return 0
        }
    }
    
    func getInitialProfileImage() -> UIImage? {
        let typeNumber = self.type.rawValue
        if typeNumber == 0 {
            return UIImage(named: "noImage")
        } else {
            return UIImage(named: "\(typeNumber)-6")
        }
    }
    
    static func getProfileImage(for type: Int, level: Int) -> UIImage? {
        if level == 10 {
            return UIImage(named: "\(type)-9")
        } else {
            return UIImage(named: "\(type)-\(level)")
        }
    }
}

extension Tamagotchi {
    static let list: [Tamagotchi] = [
        Tamagotchi(type: .ddaggeum),
        Tamagotchi(type: .bangsil),
        Tamagotchi(type: .banzzak),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
        Tamagotchi(type: .preparing),
    ]
    
    static let message: [String] = [
        "으아아아아아 배고파!",
        "깃허브 잔디 쌓으셨나요??",
        "오늘 너무 더운데 밖에 나가지 않는게 좋겠어요.",
        "오늘 기분은 어떠세요?",
        "많이 피곤하네요.. 안 피곤하신가요? 잠은 잘 주무셨어요?",
        "객체 지향 프로그래밍에 대해서 설명해주세요!",
        "오늘은 어떤 음식을 먹을까요? 저는 닭꼬치가 먹고 싶네요~~",
        "하루만 아무것도 안하고 자고 싶다~~ 흐아암...",
    ]
}
