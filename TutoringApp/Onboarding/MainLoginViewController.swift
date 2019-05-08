//
//  MainLoginViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class MainLoginViewController: UIViewController, UITextFieldDelegate {

    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.borderStyle = .line
        emailTextField.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        emailTextField.layer.borderWidth = 2
        emailTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        passwordTextField.layer.borderWidth = 2
        passwordTextField.layer.cornerRadius = 5 
        passwordTextField.borderStyle = .line
        loginButton.layer.cornerRadius = 5
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //MARK: - Actions
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else { return }
        StudentController.shared.loginUser(email: email, password: password) { (firebaseUID, error) in
            guard let firebaseUID = firebaseUID else { return }
            StudentController.shared.initializeStudent(firebaseUID: firebaseUID, completion: { (success) in
                if success {
                    print("SUCCESS LOGGING IN STUDENT!✅✅✅✅✅✅")
                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentTabBar")
                    self.present(mainVC, animated: true)
                    return 
                }
            })
            TeacherController.shared.initializeTeacher(firebaseUID: firebaseUID, completion: { (success) in
                if success {
                    print("SUCCESS LOGGING IN TEACHER!✅✅✅✅✅✅")
                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeacherTabBar")
                    self.present(mainVC, animated: true)
                    return
                }
            })
        }
    }
    func errorAlertController(error: String) {
        let alertController = UIAlertController(title: "Problem signing in", message: error, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
