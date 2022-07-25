//
//  NameViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit
import Toast

final class NameViewController: UIViewController {
 
    // MARK: - Outlets

    @IBOutlet weak var nameTextField: UITextField!
    
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
    }
}

// MARK: - Methods

extension NameViewController {
    
    private func configureUI() {
        self.configureTextField()
        self.configureNavigationBar()
    }
    
    private func configureTextField() {
        self.nameTextField.placeholder = "\(UserDefaultManager.nickname)님 이름을 입력해주세요!"
        self.nameTextField.text = UserDefaultManager.nickname
        self.nameTextField.textColor = Color.pointColor
        self.nameTextField.drawUnderLine()
    }
    
    private func configureNavigationBar() {
        self.title = "\(UserDefaultManager.nickname)님의 이름 정하기"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc func saveButtonTapped() {
        if let nickname = nameTextField.text, (2...6).contains(nickname.count) {
            UserDefaultManager.nickname = nickname
            self.navigationController?.popViewController(animated: true)
        } else {
            self.view.makeToast("2글자 이상 6글자 이하의 닉네임을 입력해주세요!")
        }
    }
}
