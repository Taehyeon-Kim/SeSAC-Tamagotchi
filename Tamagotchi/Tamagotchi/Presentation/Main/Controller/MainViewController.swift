//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class MainViewController: UIViewController {

    private var type: Int = UserDefaultManager.characterType
    private var name: String = UserDefaultManager.characterName
    private var level: Int = UserDefaultManager.level
    private var rice: Double = UserDefaultManager.rice
    private var waterdrop: Double = UserDefaultManager.waterdrop

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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateUI()
        self.configureNavigationBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.riceTextField.resignFirstResponder()
        self.waterDropTextField.resignFirstResponder()
    }
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        if let rice = Double(riceTextField.text!) {
            if 0 <= rice && rice < 100 {
                self.rice += rice
            } else {
                self.view.makeToast("0부터 100개 이하의 밥만 먹일 수 있어요😭")
            }
        } else if !riceTextField.hasText {
            self.rice += 1
        }
        self.riceTextField.text = ""
        self.updateUI()
        self.saveData()
    }
    
    @IBAction func waterdropButtonTapped(_ sender: UIButton) {
        if let waterdrop = Double(waterDropTextField.text!) {
            if 0 <= waterdrop && waterdrop < 50 {
                self.waterdrop += waterdrop
            } else {
                self.view.makeToast("0부터 50개 이하의 물방울만 먹일 수 있어요😭")
            }
        }
        else if !waterDropTextField.hasText {
            self.waterdrop += 1
        }
        
        self.waterDropTextField.text = ""
        self.updateUI()
        self.saveData()
    }
}

extension MainViewController {
    private func saveData() {
        UserDefaultManager.characterType = self.type
        UserDefaultManager.characterName = self.name
        UserDefaultManager.waterdrop = self.waterdrop
        UserDefaultManager.rice = self.rice
    }
    
    private func updateUI() {
        self.nameLabel.text = name
        self.messageLabel.text = Tamagotchi.message.randomElement()
        self.level = Tamagotchi.getLevel(rice: self.rice, waterDrop: self.waterdrop)
        self.statusLabel.text = "LV\(level) · 밥알 \(Int(rice))개 · 물방울 \(Int(waterdrop))개"
        self.profileImageView.image = Tamagotchi.getProfileImage(for: type, level: level)
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
        self.title = "\(UserDefaultManager.nickname)님의 다마고치"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(transitionToSettingViewController))
    }
    
    @objc func transitionToSettingViewController() {
        guard let settingViewController = StoryboardManager.instantiateViewController(.setting, for: SettingViewController.self) else { return }
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}
