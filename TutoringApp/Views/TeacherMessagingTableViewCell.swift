//
//  TeacherMessagingTableViewCell.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 5/1/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class TeacherMessagingTableViewCell: UITableViewCell {

    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastMessageLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    var chatLanding: Chat? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let chat = chatLanding else { return }
        nameLabel.text = "\(chat.studentID)"
    }
}
