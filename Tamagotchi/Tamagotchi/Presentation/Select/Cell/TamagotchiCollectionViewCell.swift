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
        self.nameLabel.textColor = Color.pointColor
        self.nameLabel.backgroundColor = Color.backgroundColor
        self.nameLabel.layer.borderColor = Color.pointColor.cgColor
        self.nameLabel.layer.borderWidth = 1
        self.nameLabel.layer.cornerRadius = 4
        self.nameLabel.padding(top: 8, bottom: 8, left: 6, right: 6)
    }
    
    func configureData(_ data: Tamagotchi) {
        if let profileImage = data.profileImage {
            self.profileImageView.image = profileImage
        }
        self.nameLabel.text = data.name
    }
}
