//
//  ForgotPasswordViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 5/3/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendEmailButtonTapped(_ sender: UIButton) {
        guard let emailText = emailTextField.text, !emailText.isEmpty else { return }
        StudentController.shared.updatePassword(email: emailText) { (success, error) in
            if let error = error {
                print(error.localizedDescription)
                self.alertControllerError(error: error)
            } else {
                self.alertController()
            }
        }
    }
    
    func alertController() {
        let alertController = UIAlertController(title: "Check your email!", message: "An email has been sent to the address you provided us, you can reset your password using that link!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel) { (_) in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destinationVC = storyboard.instantiateViewController(withIdentifier: "loginScreen")
            self.present(destinationVC, animated: true)
        }
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
    func alertControllerError(error: Error) {
        let alertController = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
}
