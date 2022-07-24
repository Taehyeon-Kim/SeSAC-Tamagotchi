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
        self.nameLabel.font = .systemFont(ofSize: 12)
        self.nameLabel.layer.borderColor = UIColor.gray.cgColor
        self.nameLabel.layer.borderWidth = 1
        self.nameLabel.layer.cornerRadius = 4
        self.nameLabel.padding(top: 8, bottom: 8, left: 4, right: 4)
    }
    
    func configureData(_ data: Tamagotchi) {
        if let profileImage = data.profileImage {
            self.profileImageView.image = profileImage
        }
        self.nameLabel.text = data.name
    }
}
