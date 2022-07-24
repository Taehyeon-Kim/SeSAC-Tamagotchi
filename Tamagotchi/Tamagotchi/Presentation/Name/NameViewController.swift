//
//  NameViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class NameViewController: UIViewController {
    
    var name: String?

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTextField()
    }
}

extension NameViewController {
    private func configureTextField() {
        self.name = "고래밥"
        self.nameTextField.text = name
        self.nameTextField.textColor = Color.pointColor
        self.nameTextField.drawUnderLine()
    }
}
