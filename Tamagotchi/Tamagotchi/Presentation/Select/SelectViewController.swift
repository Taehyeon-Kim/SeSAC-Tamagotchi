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
        self.configureUI()
        self.configureNavigationBar()
        self.configureCollectionView()
    }
    
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
            let confirmAction = UIAlertAction(title: "확인", style: .default)
            self.makeAlert(title: "캐릭터가 준비중이에요!", message: nil, confirmAction: confirmAction)
        } else {
            guard let detailViewController = UIStoryboard(name: "DetailViewController", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
            detailViewController.modalPresentationStyle = .overFullScreen
            detailViewController.modalTransitionStyle = .crossDissolve
            self.present(detailViewController, animated: true)
        }
    }
}

extension SelectViewController {
    private func configureUI() {
        self.collectionView.backgroundColor = .clear
        self.view.backgroundColor = Color.backgroundColor
    }
    
    private func configureNavigationBar() {
        self.title = "다마고치 선택하기"
    }
}
