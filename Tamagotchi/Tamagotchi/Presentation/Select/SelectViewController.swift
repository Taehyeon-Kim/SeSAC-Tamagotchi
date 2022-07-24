//
//  SelectViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class SelectViewController: UICollectionViewController {
    
    private let spacing: CGFloat = 20
    private let tamagotchiList: [Tamagotchi] = Tamagotchi.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.configureCollectionView()
    }
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - (spacing * 4)
        let cellWidth = width / 3
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.2)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        self.collectionView.collectionViewLayout = layout
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tamagotchiList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: TamagotchiCollectionViewCell.cellID, for: indexPath) as? TamagotchiCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configureData(self.tamagotchiList[indexPath.row])
        return cell
    }
}

extension SelectViewController {
    private func configureNavigationBar() {
        self.title = "다마고치 선택하기"
    }
}
