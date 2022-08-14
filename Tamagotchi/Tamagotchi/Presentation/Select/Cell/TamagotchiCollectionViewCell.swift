//
//  TamagotchiCollectionViewCell.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/24.
//

import UIKit

final class TamagotchiCollectionViewCell: UICollectionViewCell {
    static let cellID: String = "TamagotchiCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: CustomPaddingLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUI()
    }
    
    private func configureUI() {
        self.nameLabel.font = .boldSystemFont(ofSize: 11)
        self.nameLabel.textColor = Pallete.pointColor
        self.nameLabel.backgroundColor = Pallete.backgroundColor
        self.nameLabel.makeRoundedWithBorder(radius: 4, color: Pallete.pointColor)
        self.nameLabel.padding(top: 8, bottom: 8, left: 6, right: 6)
    }
    
    func configureData(_ data: Tamagotchi) {
        self.profileImageView.image = data.getInitialProfileImage()
        self.nameLabel.text = data.name
    }
}
