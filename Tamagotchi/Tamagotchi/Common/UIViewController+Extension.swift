//
//  UIViewController+Extension.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/25.
//

import UIKit

extension UIViewController {
    func makeAlert(
        title: String,
        message: String?,
        cancelAction: UIAlertAction,
        confirmAction: UIAlertAction
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true)
    }
    
    func makeAlert(
        title: String,
        message: String?,
        confirmAction: UIAlertAction
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true)
    }
}
