//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class DetailViewController: UIViewController {
    
    var type: SelectType?
    var tamagotchi: Tamagotchi?

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: CustomPaddingLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.configureData()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        self.saveData()
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        guard let mainViewController = StoryboardManager.instantiateViewController(.main, for: MainViewController.self) else { return }
        sceneDelegate?.window?.rootViewController = UINavigationController(rootViewController: mainViewController)
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}

extension DetailViewController {
    private func configureUI() {
        self.configureContainerView()
        self.configureButtons()
        self.configureLabels()
    }
    
    private func configureData() {
        self.profileImageView.image = tamagotchi?.getInitialProfileImage()
        self.nameLabel.text = tamagotchi?.name
        self.descriptionLabel.text = tamagotchi?.description
    }
    
    private func configureContainerView() {
        self.containerView.backgroundColor = Color.backgroundColor
        self.containerView.layer.cornerRadius = 8
    }
    
    private func configureLabels() {
        self.nameLabel.padding(top: 4, bottom: 4, left: 6, right: 6)
        self.nameLabel.font = .boldSystemFont(ofSize: 15)
        self.nameLabel.textColor = Color.pointColor
        self.nameLabel.makeRoundedWithBorder(radius: 4, color: Color.pointColor)
        self.descriptionLabel.textColor = Color.pointColor
        self.descriptionLabel.font = .systemFont(ofSize: 13)
    }

    private func configureButtons() {
        self.startButton.setTitle(type?.buttonTitle, for: .normal)
        self.cancelButton.setTitleColor(Color.pointColor, for: .normal)
        self.startButton.setTitleColor(Color.pointColor, for: .normal)
        self.cancelButton.makeBorder(color: Color.pointColor, borderWith: 0.5)
        self.startButton.makeBorder(color: Color.pointColor, borderWith: 0.5)
    }
    
    private func saveData() {
        UserDefaultManager.isAppFirstLaunch = false
        UserDefaultManager.characterType = tamagotchi?.type.rawValue ?? 0
        UserDefaultManager.characterName = tamagotchi?.name ?? ""
        UserDefaultManager.waterdrop = tamagotchi?.waterDrop ?? 0
        UserDefaultManager.rice = tamagotchi?.rice ?? 0
    }
}
