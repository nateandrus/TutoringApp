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
        mentorButton.layer.borderWidth = 2
        mentorButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        menteeButton.layer.cornerRadius = 5
        mentorButton.layer.cornerRadius = 5
    }
}
