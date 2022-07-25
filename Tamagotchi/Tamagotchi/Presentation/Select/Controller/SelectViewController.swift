//
//  SelectViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

enum SelectType {
    case select, edit
    
    var title: String {
        switch self {
        case .select:
            return "다마고치 선택하기"
        case .edit:
            return "다마고치 변경하기"
        }
    }
    
    var buttonTitle: String {
        switch self {
        case .select:
            return "시작하기"
        case .edit:
            return "변경하기"
        }
    }
}

final class SelectViewController: UICollectionViewController {
    
    var type: SelectType = .select
    private let spacing: CGFloat = 20
    private let tamagotchiList: [Tamagotchi] = Tamagotchi.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.configureNavigationBar()
        self.configureCollectionView()
    }
}

// MARK: - Methods

extension SelectViewController {
    private func configureUI() {
        self.collectionView.backgroundColor = .clear
        self.view.backgroundColor = Color.backgroundColor
    }
    
    private func configureNavigationBar() {
        self.title = self.type.title
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
            self.makeAlert(title: "캐릭터가 준비중이에요!", message: nil, confirmTitle: "확인")
        } else {
            guard let detailViewController = StoryboardManager.instantiateViewController(.detail, for: DetailViewController.self) else { return }
            detailViewController.modalPresentationStyle = .overFullScreen
            detailViewController.modalTransitionStyle = .crossDissolve
            detailViewController.tamagotchi = tamagotchiList[indexPath.row]
            detailViewController.type = self.type
            self.present(detailViewController, animated: true)
        }
    }
}
