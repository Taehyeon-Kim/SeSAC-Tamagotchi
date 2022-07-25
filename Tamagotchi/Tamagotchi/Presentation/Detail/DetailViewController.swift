//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class DetailViewController: UIViewController {
    
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
       
        guard let rootViewController = UIStoryboard(name: "MainViewController", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }

        sceneDelegate?.window?.rootViewController = UINavigationController(rootViewController: rootViewController)
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
        self.nameLabel.layer.borderColor = Color.pointColor.cgColor
        self.nameLabel.layer.borderWidth = 1
        self.nameLabel.layer.cornerRadius = 4
        self.descriptionLabel.textColor = Color.pointColor
        self.descriptionLabel.font = .systemFont(ofSize: 13)
    }

    private func configureButtons() {
        self.cancelButton.setTitleColor(Color.pointColor, for: .normal)
        self.startButton.setTitleColor(Color.pointColor, for: .normal)
        self.cancelButton.layer.borderColor = Color.pointColor.cgColor
        self.cancelButton.layer.borderWidth = 0.5
        self.startButton.layer.borderColor = Color.pointColor.cgColor
        self.startButton.layer.borderWidth = 0.5
    }
    
    private func saveData() {
        UserDefaults.standard.set(tamagotchi?.type.rawValue, forKey: "type")
        UserDefaults.standard.set(tamagotchi?.name, forKey: "name")
        UserDefaults.standard.set(tamagotchi?.waterDrop, forKey: "waterDrop")
        UserDefaults.standard.set(tamagotchi?.rice, forKey: "rice")
    }
}
