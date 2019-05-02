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
        guard let chat = chatLanding else { return }
        nameLabel.text = "\(chat.teacherID)"
        if let date = chat.timestamp {
            timestampLabel.text = date.stringWith(dateStyle: .medium, timeStyle: .medium)
        }
        if let messagePreview = chat.messagePreview {
            lastMessageLabel.text = messagePreview
        }
    }
}
