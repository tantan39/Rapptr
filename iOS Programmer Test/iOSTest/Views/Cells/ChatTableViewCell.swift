//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var body: UILabel!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    private func setupUI() {
        userImageView.contentMode = .scaleAspectFit
        userImageView.layer.cornerRadius = userImageView.bounds.width/2.0
        userImageView.clipsToBounds = true
        
        header.font = .systemFont(ofSize: 13, weight: .semibold)
        header.textColor = .message
        header.numberOfLines = 1
        
        bubbleView.backgroundColor = .white
        bubbleView.layer.borderColor = UIColor(hex: "#EFEFEF").cgColor
        bubbleView.layer.borderWidth = 1.0
        bubbleView.layer.cornerRadius = 8.0
        
        body.font = .systemFont(ofSize: 15, weight: .regular)
        body.numberOfLines = 0
        body.textColor = .message
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        header.text = message.username
        body.text = message.text
        DispatchQueue.global().async {
            if let url = message.avatarURL {
                let data = try! Data(contentsOf: url)
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.userImageView.image = image
                }
            }
            
        }
        
    }
}
