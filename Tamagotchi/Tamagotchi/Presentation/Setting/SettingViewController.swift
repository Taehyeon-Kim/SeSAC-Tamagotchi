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
        cell.imageView?.image = SettingOption.allCases[indexPath.row].image
        cell.textLabel?.text = SettingOption.allCases[indexPath.row].title
        cell.detailTextLabel?.text = SettingOption.allCases[indexPath.row].detail
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch SettingOption.allCases[indexPath.row] {
        case .name:
            guard let nameViewController = UIStoryboard(name: "NameViewController", bundle: nil).instantiateViewController(withIdentifier: "NameViewController") as? NameViewController else { return }
            self.navigationController?.pushViewController(nameViewController, animated: true)
        case .tamagotchi:
            return
        case .data:
            let cancelAction = UIAlertAction(title: "아니", style: .cancel, handler: nil)
            let confirmAction = UIAlertAction(title: "응", style: .default, handler: nil)
            self.makeAlert(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", cancelAction: cancelAction, confirmAction: confirmAction)
        }
    }
}

extension SettingViewController {
    private func configureNavigationBar() {
        self.title = "설정"
    }
}
