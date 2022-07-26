//
//  SelectViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class SelectViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    var type: SelectSceneState = .select
    private let spacing: CGFloat = 20
    private let tamagotchiList: [Tamagotchi] = Tamagotchi.list
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
        self.configureCollectionView()
    }
}

// MARK: - Methods

extension SelectViewController {
    
    private func configureUI() {
        self.view.backgroundColor = Pallete.backgroundColor
        self.configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        self.title = self.type.title
    }
    
    private func transitionToDetailViewController(indexPath: IndexPath) {
        guard let detailViewController = StoryboardManager.instantiateViewController(.detail, for: DetailViewController.self) else { return }
        detailViewController.modalPresentationStyle = .overFullScreen
        detailViewController.modalTransitionStyle = .crossDissolve
        detailViewController.type = self.type
        detailViewController.tamagotchi = tamagotchiList[indexPath.row]
        self.present(detailViewController, animated: true)
    }
}

// MARK: - CollectionView Methods

extension SelectViewController {
    
    private func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width - (spacing * 4)
        let cellWidth = width / 3
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.4)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        self.collectionView.collectionViewLayout = layout
        self.collectionView.backgroundColor = .clear
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
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if tamagotchiList[indexPath.row].type == .preparing {
            self.makeAlert(title: "⏰ 캐릭터가 준비중이에요!", message: nil, confirmTitle: "확인")
        } else {
            self.transitionToDetailViewController(indexPath: indexPath)
        }
    }
}
