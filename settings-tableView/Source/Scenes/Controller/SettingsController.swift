//
//  SettingsViewController.swift
//  settings-tableView
//
//  Created by Zhuldyz Bukeshova on 23.03.2023.
//

import UIKit

final class SettingsController: UIViewController {
    private var model: [[Setting]]?

    private var settingView: SettingView? {
        guard isViewLoaded else { return nil }
        return view as? SettingView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = SettingView()
        model = Setting.settingCells
        
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
        configTable()
    }
}

extension SettingsController {
    func configTable() {
        settingView?.tableView.dataSource = self
        settingView?.tableView.delegate = self
    }
}

extension SettingsController: UITableViewDelegate, UITableViewDataSource  {
    func numberOfSections(in tableView: UITableView) -> Int {
        return model?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?[section].count ?? 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellType = model?[indexPath.section][indexPath.row].type else { return 44 }

        switch cellType {
        case .standart, .cellWithSwitch:
            return 44
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = model?[indexPath.section][indexPath.row] else { return UITableViewCell() }

        switch cell.type {
        case .standart:
            let standartCell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell
            guard let standartCell = standartCell else { return UITableViewCell() }
            standartCell.configureCell(cellModel: cell)
            standartCell.accessoryType = .disclosureIndicator
            return standartCell
        case .cellWithSwitch:
            let standartCell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier) as? SettingTableViewCell
            guard let standartCell = standartCell else { return UITableViewCell() }
            standartCell.configureCell(cellModel: cell)
            standartCell.selectionStyle = .none
            return standartCell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let cell = model?[indexPath.section][indexPath.row] else { return }
        print("Cell typed: \(cell.title)")

        switch cell.type {
        case .cellWithSwitch:
            return
        case .standart:
            let settingCell = model?[indexPath.section][indexPath.row]
            let detailController = DetailController(settingCell: settingCell)
            navigationController?.pushViewController(detailController, animated: true)
        }
    }
}
