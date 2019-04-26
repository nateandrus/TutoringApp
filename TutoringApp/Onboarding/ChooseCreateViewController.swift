//
//  ChooseCreateViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class ChooseCreateViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var menteeButton: UIButton!
    @IBOutlet weak var mentorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menteeButton.layer.cornerRadius = menteeButton.frame.height / 2
        mentorButton.layer.cornerRadius = mentorButton.frame.height / 2
    }
}
