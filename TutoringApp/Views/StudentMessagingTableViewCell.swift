//
//  StudentMessagingTableViewCell.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 5/1/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class StudentMessagingTableViewCell: UITableViewCell {

    @IBOutlet weak var messagingImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    
    var chatLanding: Chat? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let chat = chatLanding, let teachername = chatLanding?.teacherName else { return }
        nameLabel.text = teachername
        if let date = chat.timestamp {
            timestampLabel.text = "\(Date(timeIntervalSince1970: date).stringWith(dateStyle: .none, timeStyle: .short)) >"
        }
        messagingImageView.layer.cornerRadius = messagingImageView.frame.height / 2 
        if let messagePreview = chat.messagePreview {
            lastMessageLabel.text = messagePreview
        }
    }
}
