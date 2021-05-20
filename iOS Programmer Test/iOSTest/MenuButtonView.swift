//
//  MenuButton.swift
//  iOSTest
//
//  Created by Tan Tan on 5/20/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

class MenuButtonView: UIButton {
    private let icon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView(title: String = "", icon: UIImage = .init()) {
        self.setTitle(title, for: .normal)
        self.setImage(icon, for: .normal)
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.backgroundColor = .viewBackground
        self.layer.opacity = 0.8
        self.contentHorizontalAlignment = .left
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 22, bottom: 0, right: 0)
        self.titleEdgeInsets = .init(top: 0, left: Dimension.shared.largeVerticalMargin_32, bottom: 0, right: 0)
        
    }
}
