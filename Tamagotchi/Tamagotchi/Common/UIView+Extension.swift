//
//  UIView+Extension.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/25.
//

import UIKit

extension UIView {
    func makeRounded(radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
}
