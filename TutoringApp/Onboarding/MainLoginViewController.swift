//
//  MainLoginViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class MainLoginViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
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