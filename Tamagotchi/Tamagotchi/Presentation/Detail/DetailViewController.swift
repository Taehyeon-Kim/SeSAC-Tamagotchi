//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class DetailViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: CustomPaddingLabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    private func configureUI() {
        self.containerView.backgroundColor = Color.backgroundColor
        self.containerView.layer.cornerRadius = 8
        self.nameLabel.padding(top: 4, bottom: 4, left: 6, right: 6)
        self.nameLabel.font = .boldSystemFont(ofSize: 15)
        self.nameLabel.textColor = Color.pointColor
        self.nameLabel.layer.borderColor = Color.pointColor.cgColor
        self.nameLabel.layer.borderWidth = 1
        self.nameLabel.layer.cornerRadius = 4
        self.descriptionLabel.textColor = Color.pointColor
        self.descriptionLabel.font = .systemFont(ofSize: 13)
        self.cancelButton.setTitleColor(Color.pointColor, for: .normal)
        self.startButton.setTitleColor(Color.pointColor, for: .normal)
        self.cancelButton.layer.borderColor = Color.pointColor.cgColor
        self.cancelButton.layer.borderWidth = 0.5
        self.startButton.layer.borderColor = Color.pointColor.cgColor
        self.startButton.layer.borderWidth = 0.5
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
       
        guard let rootViewController = UIStoryboard(name: "MainViewController", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }

        sceneDelegate?.window?.rootViewController = UINavigationController(rootViewController: rootViewController)
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}
