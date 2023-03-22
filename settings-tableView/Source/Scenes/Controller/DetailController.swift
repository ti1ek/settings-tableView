//
//  DetailController.swift
//  settings-tableView
//
//  Created by Zhuldyz Bukeshova on 23.03.2023.
//

import UIKit

final class DetailController: UIViewController {
    var model: Setting?

    private var detailView: DetailView? {
        guard isViewLoaded else { return nil }
        return view as? DetailView
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view = DetailView()
        configureView()
    }

    //MARK: - Initializers
    convenience init(settingCell: Setting?) {
        self.init()
        self.model = settingCell
    }
}

private extension DetailController {
    func configureView() {
        detailView?.fillSetting(settingCell: model)
    }
}
