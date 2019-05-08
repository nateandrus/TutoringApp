//
//  BecomeMentorViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class BecomeMentorViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextfield: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var DateOfBirthTextField: UITextField!
    @IBOutlet weak var nextStepButton: UIButton!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatKeyboard()
        nextStepButton.layer.cornerRadius = 5
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        confirmPasswordTextfield.layer.borderWidth = 2
        confirmPasswordTextfield.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        cityTextField.layer.borderWidth = 2
        cityTextField.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        DateOfBirthTextField.layer.borderWidth = 2
        DateOfBirthTextField.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
    }
    

    
    @IBAction func nextStepButtonTapped(_ sender: UIButton) {
        guard let password = passwordTextField.text, !password.isEmpty,
            passwordTextField.text == confirmPasswordTextfield.text, let name = nameTextField.text, !name.isEmpty, let email = emailTextField.text, !email.isEmpty else {
                alertController()
                return
        }
        TeacherController.shared.createAuthorizedTeacherUser(email: email, password: password) { (userFirebaseUID, error) in
            if let error = error {
                print(error.localizedDescription)
                self.errorAlertController(error: error.localizedDescription)
                return
            }
            guard let nameText = self.nameTextField.text, !nameText.isEmpty,
                let emailText = self.emailTextField.text, !emailText.isEmpty,
                let passwordText = self.passwordTextField.text, !passwordText.isEmpty,
                let confirmPassword = self.confirmPasswordTextfield.text, !confirmPassword.isEmpty,
                let location = self.cityTextField.text, !location.isEmpty,
                let dateOfBirth = self.DateOfBirthTextField.text, !dateOfBirth.isEmpty, let userFirebaseUID = userFirebaseUID, let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "subjectsVC") as? SubjectsViewController else { return }
            
            destinationVC.nameLandingPad = nameText
            destinationVC.email = emailText
            destinationVC.location = location
            destinationVC.dateOfBirth = dateOfBirth
            destinationVC.userFirebaseUID = userFirebaseUID
            self.present(destinationVC, animated: true)
        }
    }
    
    func alertController() {
        let alertController = UIAlertController(title: "Something isn't right", message: "For some reason we aren't able to take you to the next page, make sure all of the fields are filled out and the passwords match.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
    func errorAlertController(error: String) {
        let alertController = UIAlertController(title: "Problem signing in", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    func formatKeyboard() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
            guard let userInfo = notification.userInfo,
                let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            self.bottomConstraint.constant += keyboardFrame.height
            self.view.layoutSubviews()
            let frameInContentView = self.nameTextField.convert(self.nameTextField.bounds, to: self.contentView)
            let offSetPoint = CGPoint(x: self.contentView.frame.origin.x, y: frameInContentView.origin.y - frameInContentView.height)
            self.scroll.setContentOffset(offSetPoint, animated: true)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
            self.bottomConstraint.constant = 0
        }
    }
}

