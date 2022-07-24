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
        cancelTitle: String,
        confirmTitle: String,
        cancelHandler: (() -> Void)? = nil,
        confirmHandler: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { _ in cancelHandler?() }
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default) { _ in confirmHandler?() }
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true)
    }
    
    func makeAlert(
        title: String,
        message: String?,
        confirmTitle: String,
        confirmHandler: (() -> Void)? = nil
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: confirmTitle, style: .default) { _ in confirmHandler?() }
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true)
    }
}
