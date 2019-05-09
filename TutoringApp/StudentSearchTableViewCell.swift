//
//  StudentSearchTableViewCell.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class StudentSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    var teacher: Teacher? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let teacher = teacher else { return }
        nameLabel.text = teacher.name
        locationLabel.text = teacher.location
        priceLabel.text = "$\(teacher.costForTime)/hr"
        aboutLabel.text = teacher.aboutMe
        profileImage.layer.cornerRadius = profileImage.frame.height / 2 
    }
}
