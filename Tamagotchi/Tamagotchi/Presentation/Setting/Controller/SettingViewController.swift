//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class SettingViewController: UITableViewController {
    
    private enum SettingOption: Int, CaseIterable {
        case name, tamagotchi, data
        
        var image: UIImage? {
            switch self {
            case .name:
                return UIImage(systemName: "pencil")
            case .tamagotchi:
                return UIImage(systemName: "moon.fill")
            case .data:
                return UIImage(systemName: "arrow.clockwise")
            }
        }
        
        var title: String {
            switch self {
            case .name:
                return "내 이름 설정하기"
            case .tamagotchi:
                return "다마고치 변경하기"
            case .data:
                return "데이터 초기화"
            }
        }
        
        var detail: String? {
            switch self {
            case .name:
                return "고래밥"
            case .tamagotchi, .data:
                return nil
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.configureNavigationBar()
    }
}

extension SettingViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOption.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell") as? OptionTableViewCell else {
            return UITableViewCell()
        }
        self.configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch SettingOption.allCases[indexPath.row] {
        case .name:
            guard let nameViewController = StoryboardManager.instantiateViewController(.name, for: NameViewController.self) else { return }
            self.navigationController?.pushViewController(nameViewController, animated: true)
        case .tamagotchi:
            guard let selectViewController = StoryboardManager.instantiateViewController(.select, for: SelectViewController.self) else { return }
            self.navigationController?.pushViewController(selectViewController, animated: true)
        case .data:
            self.makeAlert(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", cancelTitle: "아니", confirmTitle: "응", cancelHandler: nil) {
                self.resetData()
                self.changeRootViewController()
            }
        }
    }
}

extension SettingViewController {
    private func configureUI() {
        self.view.backgroundColor = Color.backgroundColor
    }
    
    private func configureNavigationBar() {
        self.title = "설정"
    }
    
    private func configureCell(_ cell: UITableViewCell, indexPath: IndexPath) {
        cell.backgroundColor = .clear
        cell.imageView?.tintColor = Color.pointColor
        cell.imageView?.image = SettingOption.allCases[indexPath.row].image
        cell.textLabel?.text = SettingOption.allCases[indexPath.row].title
        cell.detailTextLabel?.text = SettingOption.allCases[indexPath.row].detail
        cell.detailTextLabel?.textColor = Color.pointColor
    }
    
    private func changeRootViewController() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        guard let selectViewController = StoryboardManager.instantiateViewController(.select, for: SelectViewController.self) else { return }
        sceneDelegate?.window?.rootViewController = UINavigationController(rootViewController: selectViewController)
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    private func resetData() {
        UserDefaultManager.isAppFirstLaunch = true
        UserDefaultManager.characterType = 0
        UserDefaultManager.nickname = "대장"
        UserDefaultManager.characterName = ""
        UserDefaultManager.level = 1
        UserDefaultManager.rice = 0
        UserDefaultManager.waterdrop = 0
    }
}
