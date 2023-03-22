//
//  SettingTableViewCell.swift
//  settings-tableView
//
//  Created by Zhuldyz Bukeshova on 23.03.2023.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    static let identifier = String(describing: SettingTableViewCell.self)

    //MARK: - Outlets

    private lazy var iconImageView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        return view
    }()

    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        return imageView
    }()

    private lazy var title: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        return lable
    }()

    private lazy var additionalText: UILabel = {
        let lable = UILabel()
        lable.textColor = .systemGray
        return lable
    }()

    private lazy var cellSwitch: UISwitch = {
        let cellSwitch = UISwitch()
        cellSwitch.isHidden = true
        return cellSwitch
    }()

    //MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(title)
        contentView.addSubview(additionalText)
        contentView.addSubview(cellSwitch)
        contentView.addSubview(iconImageView)
        iconImageView.addSubview(icon)
    }

    private func setupLayout() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }

        icon.snp.makeConstraints { make in
            make.center.equalTo(iconImageView)
            make.height.width.equalTo(23)
        }

        title.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(iconImageView.snp.right).offset(20)
        }

        additionalText.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-20)
        }

        cellSwitch.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.right.equalTo(contentView).offset(-20)
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.cellSwitch.isHidden = true
        additionalText.isHidden = true
    }

    // MARK: - Action

    func configureCell(cellModel: Setting?)  {
        if cellModel?.type == .cellWithSwitch {
            additionalText.isHidden = true
            cellSwitch.isHidden = false
        } else if cellModel?.additionalText != nil {
            additionalText.isHidden = false
            cellSwitch.isHidden = true
        }

        icon.image = cellModel?.icon
        title.text = cellModel?.title
        additionalText.text = cellModel?.additionalText
        iconImageView.backgroundColor = cellModel?.imageBackgroundColor
    }
}
