//
//  SettingModel.swift
//  settings-tableView
//
//  Created by Zhuldyz Bukeshova on 23.03.2023.
//

import UIKit

enum CellType {
    case standart
    case cellWithSwitch
}

struct Setting: Hashable {
    var type: CellType
    var icon: UIImage?
    var title: String
    var additionalText: String?
    var imageBackgroundColor: UIColor? = .systemGray
}

extension Setting {
    static var settingCells: [[Setting]] = [
        [Setting(type: .cellWithSwitch,
                 icon: UIImage(systemName: "airplane"),
                 title: "Airplane Mode",
                 imageBackgroundColor: .systemOrange),
         Setting(type: .standart,
                 icon: UIImage(systemName: "wifi"),
                 title: "Wi-Fi",
                 additionalText: "Altel 5G",
                 imageBackgroundColor: .link),
         Setting(type: .standart,
                 icon: UIImage(named: "bluetooth"),
                 title: "Bluetooth",
                 additionalText: "Off",
                 imageBackgroundColor: .systemBlue),
         Setting(type: .standart,
                 icon: UIImage(systemName: "antenna.radiowaves.left.and.right"),
                 title: "Mobile Data",
                 imageBackgroundColor: .systemGreen),
         Setting(type: .standart,
                 icon: UIImage(systemName: "personalhotspot"),
                 title: "Personal Hostpot",
                 imageBackgroundColor: .systemGreen),
         ],

        [Setting(type: .standart,
                 icon: UIImage(systemName: "bell.badge"),
                 title: "Notifications",
                 imageBackgroundColor: .systemRed),
         Setting(type: .standart,
                 icon: UIImage(systemName: "speaker.wave.3.fill"),
                 title: "Sounds & Haptics",
                 imageBackgroundColor: .systemRed),
         Setting(type: .standart,
                 icon: UIImage(systemName: "moon.fill"),
                 title: "Focus",
                 imageBackgroundColor: .systemIndigo),
         Setting(type: .standart,
                 icon: UIImage(systemName: "hourglass"),
                 title: "Screen Time",
                 imageBackgroundColor: .systemIndigo)],

        [Setting(type: .standart,
                 icon: UIImage(systemName: "gear"),
                 title: "General",
                 imageBackgroundColor: .systemGray),
         Setting(type: .standart,
                 icon: UIImage(systemName: "switch.2"),
                 title: "Control Centre",
                 imageBackgroundColor: .systemGray),
         Setting(type: .standart,
                 icon: UIImage(systemName: "textformat.size"),
                 title: "Display & Brightness",
                 imageBackgroundColor: .systemBlue),
         Setting(type: .standart,
                 icon: UIImage(systemName: "figure.arms.open"),
                 title: "Accessibility",
                 imageBackgroundColor: .link),
         Setting(type: .standart,
                 icon: UIImage(systemName: "faceid"),
                 title: "Face ID Passcode",
                 imageBackgroundColor: .systemGreen),
         Setting(type: .standart,
                 icon: UIImage(systemName: "sos"),
                 title: "Emergency SOS",
                 imageBackgroundColor: .systemRed),
         Setting(type: .standart,
                 icon: UIImage(systemName: "microbe.fill"),
                 title: "Exposure Notifications",
                 imageBackgroundColor: .systemRed),
         Setting(type: .standart,
                 icon: UIImage(systemName: "battery.100"),
                 title: "Battery",
                 imageBackgroundColor: .systemGreen),
         Setting(type: .standart,
                 icon: UIImage(systemName: "hand.raised.fill"),
                 title: "Privacy & Security",
                 imageBackgroundColor: .link)]
    ]
}
