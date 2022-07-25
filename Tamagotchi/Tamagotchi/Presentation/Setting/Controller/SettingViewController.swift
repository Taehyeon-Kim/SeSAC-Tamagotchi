//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class SettingViewController: UITableViewController {

    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
        self.configureNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
}

// MARK: - TableView Methods

extension SettingViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingOptionType.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell") as? OptionTableViewCell else {
            return UITableViewCell()
        }
        self.configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch SettingOptionType.allCases[indexPath.row] {
        case .name:
            self.transitionToNameViewController()
        case .tamagotchi:
            self.transitionToSelectViewController()
        case .data:
            self.makeAlert(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", cancelTitle: "아니", confirmTitle: "응", cancelHandler: nil) {
                self.resetData()
                self.changeRootViewController()
            }
        }
    }
}

// MARK: - Methods

extension SettingViewController {
    private func configureUI() {
        self.view.backgroundColor = Color.backgroundColor
    }
    
    private func configureNavigationBar() {
        self.title = "설정"
    }
    
    private func configureCell(_ cell: UITableViewCell, indexPath: IndexPath) {
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.imageView?.tintColor = Color.pointColor
        cell.imageView?.image = SettingOptionType.allCases[indexPath.row].image
        cell.textLabel?.text = SettingOptionType.allCases[indexPath.row].title
        cell.detailTextLabel?.text = SettingOptionType.allCases[indexPath.row].detail
        cell.detailTextLabel?.textColor = Color.pointColor
    }
    
    private func changeRootViewController() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
        guard let selectViewController = StoryboardManager.instantiateViewController(.select, for: SelectViewController.self) else { return }
        sceneDelegate?.window?.rootViewController = UINavigationController(rootViewController: selectViewController)
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    private func transitionToNameViewController() {
        guard let nameViewController = StoryboardManager.instantiateViewController(.name, for: NameViewController.self) else { return }
        self.navigationController?.pushViewController(nameViewController, animated: true)
    }
    
    private func transitionToSelectViewController() {
        guard let selectViewController = StoryboardManager.instantiateViewController(.select, for: SelectViewController.self) else { return }
        selectViewController.type = .change
        self.navigationController?.pushViewController(selectViewController, animated: true)
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
