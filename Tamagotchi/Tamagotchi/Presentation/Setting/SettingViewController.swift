//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by taekki on 2022/07/23.
//

import UIKit

final class SettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTableViewCell") as? OptionTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
