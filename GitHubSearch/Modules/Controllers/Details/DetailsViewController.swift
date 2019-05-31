//
//  DetailsViewController.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit
import SnapKit

final class DetailsViewController: UIViewController {

    var viewModel: DetailsViewModel

    fileprivate var detailsStackView: DetailsStackView?

    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

}

// MARK: - Setup views
extension DetailsViewController {

    fileprivate func initialSetup() {
        view.backgroundColor = .white
        title = "Repository"
        setupViews()
        setupNavigationBarRightButton()
    }

    private func setupViews() {
        detailsStackView = DetailsStackView(repository: viewModel.repository)
        guard let detailsStackView = detailsStackView else { return }
        view.addSubview(detailsStackView)

        detailsStackView.snp.makeConstraints { make in
            make.left.top.right.equalTo(self.view.safeAreaLayoutGuide)
            make.bottom.lessThanOrEqualTo(self.view.safeAreaLayoutGuide)
        }
    }

    private func setupNavigationBarRightButton() {
        let title = viewModel.repository.isFavorite ? "移除我的最愛" : "加入我的最愛"
        let favoriteBtn = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(favoriteButtonTapped))
        favoriteBtn.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
        navigationItem.rightBarButtonItem = favoriteBtn
    }

    @objc private func favoriteButtonTapped() {
        if !viewModel.repository.isFavorite {
            print("Favorite")
            viewModel.toggleFavorite()
            let favoriteBtn = UIBarButtonItem(title: "加入我的最愛", style: .plain, target: self, action: #selector(favoriteButtonTapped))
            favoriteBtn.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
            navigationItem.rightBarButtonItem = favoriteBtn

        } else {
            print("Delete from Favorite")
            viewModel.toggleFavorite()
            let favoriteBtn = UIBarButtonItem(title: "移除我的最愛", style: .plain, target: self, action: #selector(favoriteButtonTapped))
            favoriteBtn.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.black], for: .normal)
            navigationItem.rightBarButtonItem = favoriteBtn
        }
    }
}
