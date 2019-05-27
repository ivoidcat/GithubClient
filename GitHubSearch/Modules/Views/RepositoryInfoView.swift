//
//  RepositoryInfoView.swift
//  GitHubSearch
//
//  Created by Eugene Karambirov on 01/02/2019.
//  Copyright © 2019 Eugene Karambirov. All rights reserved.
//

import UIKit
import SnapKit

final class RepositoryInfoView: UIView {

//    override var intrinsicContentSize: CGSize {
//        return sizeThatFits(stackView.frame.size)
////        return CGSize(width: 1, height: stackView.frame.height)
//    }

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()

    fileprivate lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    override func didMoveToSuperview() {
        setupViews()
    }

}

// MARK: - Setup views
extension RepositoryInfoView {
    fileprivate func setupViews() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.left.top.equalTo(16)
            make.right.bottom.equalTo(-16)
        }
    }
}
