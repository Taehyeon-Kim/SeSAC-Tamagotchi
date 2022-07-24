//
//  Tamagotchi.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

struct Tamagotchi {
    var profileImageName: String
    let name: String
    var level: Double {
        return (self.rice / 5) + (self.waterDrop / 2)
    }
    var rice: Double
    var waterDrop: Double
    var message: String
}
