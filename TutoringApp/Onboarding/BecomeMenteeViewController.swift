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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var createAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createAccountButton.layer.cornerRadius = createAccountButton.frame.height / 2
    }
    
    //MARK: - Actions
    @IBAction func createButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty, let email = emailTextField.text, !email.isEmpty, passwordTextField.text == confirmPasswordTextField.text, let password = confirmPasswordTextField.text
            else {alertController(); return }
        StudentController.shared.createStudent(name: name, email: email, password: password) { (success) in
            if success {
                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentTabBar")
                self.present(mainVC, animated: true)
            }
        }
    }
    
    func alertController() {
        let alertController = UIAlertController(title: "Missing Information", message: "It looks like you are missing information needed to create an account, check and make sure everything is filled out and that your passwords match.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
}