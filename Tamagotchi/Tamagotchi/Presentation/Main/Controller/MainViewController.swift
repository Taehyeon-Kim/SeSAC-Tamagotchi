//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - Properties
    
    private var type: Int = UserDefaultManager.characterType
    private var name: String = UserDefaultManager.characterName
    private var level: Int = UserDefaultManager.level
    private var rice: Double = UserDefaultManager.rice
    private var waterdrop: Double = UserDefaultManager.waterdrop
    
    // MARK: - Outlets

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: CustomPaddingLabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var riceTextField: UITextField!
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterDropTextField: UITextField!
    @IBOutlet weak var waterDropButton: UIButton!
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
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
    
    // MARK: - Actions
    
    @IBAction func riceButtonTapped(_ sender: UIButton) {
        self.feed(riceTextField, for: .rice)
        self.saveData()
        self.updateUI()
    }
    
    @IBAction func waterdropButtonTapped(_ sender: UIButton) {
        self.feed(waterDropTextField, for: .waterdrop)
        self.saveData()
        self.updateUI()
    }
}

// MARK: - Methods

extension MainViewController {
    
    private func updateUI() {
        self.nameLabel.text = name
        self.messageLabel.text = Tamagotchi.message.randomElement()
        self.level = Tamagotchi.getLevel(rice: self.rice, waterDrop: self.waterdrop)
        self.statusLabel.text = "LV\(level) · 밥알 \(Int(rice))개 · 물방울 \(Int(waterdrop))개"
        self.profileImageView.image = Tamagotchi.getProfileImage(for: type, level: level)
    }
    
    private func configureUI() {
        self.view.backgroundColor = Pallete.backgroundColor
        self.configureLabels()
        self.configureTextFields()
        self.configureButtons()
        self.configureNavigationBar()
    }
    
    private func configureLabels() {
        self.messageLabel.textColor = Pallete.pointColor
        self.messageLabel.font = .boldSystemFont(ofSize: 13)
        self.nameLabel.textColor = Pallete.pointColor
        self.nameLabel.font = .boldSystemFont(ofSize: 13)
        self.nameLabel.backgroundColor = Pallete.backgroundColor
        self.nameLabel.makeRoundedWithBorder(radius: 4, color: Pallete.pointColor)
        self.nameLabel.padding(top: 6, bottom: 6, left: 8, right: 8)
        self.statusLabel.font = .boldSystemFont(ofSize: 12)
        self.statusLabel.textColor = Pallete.pointColor
    }
    
    private func configureTextFields() {
        self.riceTextField.placeholder = "밥주세요"
        self.waterDropTextField.placeholder = "물주세요"
        [self.riceTextField, self.waterDropTextField].forEach {
            $0?.textAlignment = .center
            $0?.keyboardType = .numberPad
            $0?.drawUnderLine()
        }
    }
    
    private func configureButtons() {
        [self.riceButton, self.waterDropButton].forEach {
            $0?.setTitleColor(Pallete.pointColor, for: .normal)
            $0?.makeRoundedWithBorder(radius: 4, color: Pallete.pointColor)
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
    
    private func feed(_ textField: UITextField, for feedType: FeedType) {
        guard let value = textField.text else { return }
        let limit = feedType == .rice ? 100.0 : 50.0
        
        if let feedCount = Double(value) {
            if 0 <= feedCount && feedCount < limit {
                if feedType == .rice {
                    self.rice += feedCount
                } else if feedType == .waterdrop {
                    self.waterdrop += feedCount
                }
            } else {
                self.view.makeToast("0부터 \(Int(limit))개 이하만 먹일 수 있어요😭")
            }
        } else if !textField.hasText {
            if feedType == .rice {
                self.rice += 1
            } else if feedType == .waterdrop {
                self.waterdrop += 1
            }
        }
        
        textField.text = ""
        textField.resignFirstResponder()
    }
    
    private func saveData() {
        UserDefaultManager.characterType = self.type
        UserDefaultManager.characterName = self.name
        UserDefaultManager.waterdrop = self.waterdrop
        UserDefaultManager.rice = self.rice
    }
}
