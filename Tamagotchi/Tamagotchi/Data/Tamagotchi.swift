//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

struct Tamagotchi {
    var type: TamagotchiType
    var profileImage: UIImage?  {
        return type.profileImage
    }
    var name: String {
        return type.name
    }
    var level: Double {
        return (self.rice / 5) + (self.waterDrop / 2)
    }
    var rice: Double = 0
    var waterDrop: Double = 0
    var message: String?
    var description: String? {
        return type.description
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
}
