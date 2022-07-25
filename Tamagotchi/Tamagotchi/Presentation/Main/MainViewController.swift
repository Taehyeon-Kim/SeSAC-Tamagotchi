//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class MainViewController: UIViewController {
    
    var nickname: String?

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: CustomPaddingLabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterDropTextField: UITextField!
    @IBOutlet weak var waterDropButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.configureNavigationBar()
        self.loadData()
    }
}

extension MainViewController {
    private func loadData() {
        let name = UserDefaults.standard.string(forKey: "name")
        let level = UserDefaults.standard.double(forKey: "level")
        let rice = UserDefaults.standard.double(forKey: "rice")
        let waterDrop = UserDefaults.standard.double(forKey: "waterDrop")
        
        self.nameLabel.text = name
        self.statusLabel.text = "LV\(level) · 밥알 \(rice)개 · 물방울 \(waterDrop)개"
    }
    
    private func configureUI() {
        self.view.backgroundColor = Color.backgroundColor
        self.configureLabels()
        self.configureTextFields()
        self.configureButtons()
    }
    
    private func configureLabels() {
        self.messageLabel.textColor = Color.pointColor
        self.nameLabel.textColor = Color.pointColor
        self.nameLabel.backgroundColor = Color.backgroundColor
        self.nameLabel.layer.borderColor = Color.pointColor.cgColor
        self.nameLabel.layer.borderWidth = 1
        self.nameLabel.layer.cornerRadius = 4
        self.nameLabel.padding(top: 0, bottom: 0, left: 6, right: 6)
        self.statusLabel.textColor = Color.pointColor
    }
    
    private func configureTextFields() {
        self.riceTextField.placeholder = "밥주세요"
        self.waterDropTextField.placeholder = "물주세요"
        [self.riceTextField, self.waterDropTextField].forEach {
            $0?.textAlignment = .center
            $0?.drawUnderLine()
        }
    }
    
    private func configureButtons() {
        [self.riceButton, self.waterDropButton].forEach {
            $0?.setTitleColor(Color.pointColor, for: .normal)
            $0?.layer.borderColor = Color.pointColor.cgColor
            $0?.layer.borderWidth = 1
            $0?.layer.cornerRadius = 4
        }
    }
    
    private func configureNavigationBar() {
        self.title = "\(nickname ?? "대장")님의 다마고치"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(transitionToSettingViewController))
    }
    
    @objc func transitionToSettingViewController() {
        guard let settingViewController = UIStoryboard(name: "SettingViewController", bundle: nil).instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController else { return }
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}
