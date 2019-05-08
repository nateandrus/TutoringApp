//
//  SplashScreenViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 5/8/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase

class SplashScreenViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        findUser()
    }
    
    func findUser() {
        if Auth.auth().currentUser != nil {
            let uid = Auth.auth().currentUser?.uid
            StudentController.shared.initializeStudent(firebaseUID: uid!, completion: { (success) in
                if success {
                    print("SUCCESS LOGGING IN STUDENT!✅✅✅✅✅✅")
                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "StudentTabBar")
                    self.present(mainVC, animated: true)
                    return
                }
            })
            TeacherController.shared.initializeTeacher(firebaseUID: uid!, completion: { (success) in
                if success {
                    print("SUCCESS LOGGING IN TEACHER!✅✅✅✅✅✅")
                    let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeacherTabBar")
                    self.present(mainVC, animated: true)
                    return
                }
            })
        } else {
            let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginScreen")
            self.present(mainVC, animated: true)
            return
        }
    }
}
