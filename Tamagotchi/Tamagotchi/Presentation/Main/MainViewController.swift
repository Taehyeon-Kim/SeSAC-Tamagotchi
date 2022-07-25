//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class MainViewController: UIViewController {
    
    var nickname: String?
    private var type: Int?
    private var name: String?
    private var level: Int = 0
    private var rice: Double = 0
    private var waterdrop: Double = 0

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
        self.updateUI()
    }
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        if let rice = Double(riceTextField.text!) {
            self.rice += rice
        }
        self.riceTextField.text = ""
        self.updateUI()
    }
    
    @IBAction func waterdropButtonTapped(_ sender: UIButton) {
        if let waterdrop = Double(waterDropTextField.text!) {
            self.waterdrop += waterdrop
        }
        self.waterDropTextField.text = ""
        self.updateUI()
    }
}

extension MainViewController {
    private func loadData() {
        self.type = UserDefaults.standard.integer(forKey: "type")
        self.name = UserDefaults.standard.string(forKey: "name")
        self.rice = UserDefaults.standard.double(forKey: "rice")
        self.waterdrop = UserDefaults.standard.double(forKey: "waterDrop")
        self.level = Tamagotchi.getLevel(rice: self.rice, waterDrop: self.waterdrop)
    }
    
    private func updateUI() {
        self.nameLabel.text = name
        self.level = Tamagotchi.getLevel(rice: self.rice, waterDrop: self.waterdrop)
        self.statusLabel.text = "LV\(level) · 밥알 \(Int(rice))개 · 물방울 \(Int(waterdrop))개"
        self.profileImageView.image = Tamagotchi.getProfileImage(for: type ?? 0, level: level)
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
        self.nameLabel.makeRoundedWithBorder(radius: 4, color: Color.pointColor)
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
            $0?.makeRoundedWithBorder(radius: 4, color: Color.pointColor)
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
