//
//  BiographyViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class BiographyViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var aboutMeTextView: UITextView!
    @IBOutlet weak var qualificationsTextView: UITextView!
    @IBOutlet weak var linkedInTextField: UITextField!
    @IBOutlet weak var nextStepButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeTextView.layer.cornerRadius = 15
        qualificationsTextView.layer.cornerRadius = 15
        nextStepButton.layer.cornerRadius = nextStepButton.frame.height / 2
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
