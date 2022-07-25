//
//  CustomPaddingLabel.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/24.
//

import UIKit

final class CustomPaddingLabel: UILabel {
    var insets = UIEdgeInsets.zero

    func padding(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) {
        self.frame = CGRect(x: 0, y: 0, width: self.frame.width + left + right, height: self.frame.height + top + bottom)
        self.insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += insets.top + insets.bottom
            contentSize.width += insets.left + insets.right
            return contentSize
        }
    }
}
