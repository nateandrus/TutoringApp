//
//  BecomeMenteeViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class BecomeMenteeViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        createAccountButton.layer.cornerRadius = createAccountButton.frame.height / 2
    }
    
    //MARK: - Actions
    
    @IBAction func changeProfileImageView(_ sender: UIButton) {
    }
    
    @IBAction func createButtonTapped(_ sender: UIButton) {
    }
}
