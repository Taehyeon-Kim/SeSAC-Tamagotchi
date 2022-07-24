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
    @IBOutlet weak var nameContainerView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUI()
    }
    
    private func configureUI() {
        self.nameContainerView.layer.cornerRadius = 8
        self.nameLabel.font = .boldSystemFont(ofSize: 13)
    }
}
