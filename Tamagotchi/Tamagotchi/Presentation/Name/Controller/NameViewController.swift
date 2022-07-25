//
//  NameViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit
import Toast

final class NameViewController: UIViewController {
    
    var name: String?

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTextField()
        self.configureNavigationBar()
    }
}

extension NameViewController {
    private func configureTextField() {
        self.name = UserDefaultManager.nickname
        self.nameTextField.placeholder = "\(name!)님 이름을 입력해주세요!"
        self.nameTextField.text = name
        self.nameTextField.textColor = Color.pointColor
        self.nameTextField.drawUnderLine()
    }
    
    private func configureNavigationBar() {
        self.title = "\(name ?? "대장")님의 이름 정하기"
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
