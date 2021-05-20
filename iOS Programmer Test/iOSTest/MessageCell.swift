//
//  MessageCell.swift
//  iOSTest
//
//  Created by Tan Tan on 5/20/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    private let userImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .message
        label.numberOfLines = 1
        return label
    }()
    
    private let contentBubbleView: UIView = {
        let view = UIView()
        view.backgroundColor = .viewBackground
        view.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
        view.layer.borderWidth = 1.0
        view.layer.cornerRadius = 8.0
        return view
    }()
    
    private let content: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.numberOfLines = 0
        label.textColor = .message
        return label
    }()
    
    override func prepareForReuse() {
        setupUI()
    }
    
    private func setupUI() {
        setupUserImageView()
    }
    
    private func setupUserImageView() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(userImageView)
        
        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Dimension.shared.normalHorizontalMargin),
            userImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Dimension.shared.normalVerticalMargin),
            userImageView.widthAnchor.constraint(equalToConstant: 30),
            userImageView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
