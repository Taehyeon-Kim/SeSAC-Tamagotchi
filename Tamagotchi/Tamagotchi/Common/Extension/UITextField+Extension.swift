//
//  TextField+Extension.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/25.
//

import UIKit

extension UITextField {
    func drawUnderLine(color: UIColor = Pallete.pointColor) {
        let underLine: CALayer = CALayer()
        let width: CGFloat = 1.0
        underLine.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        underLine.borderColor = color.cgColor
        underLine.borderWidth = width
        self.layer.addSublayer(underLine)
        self.layer.masksToBounds = true
    }
}
