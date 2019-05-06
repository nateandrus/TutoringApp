//
//  TeacherEditBiographyViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 5/3/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class TeacherEditBiographyViewController: UIViewController {

    @IBOutlet weak var aboutYouTextView: UITextView!
    @IBOutlet weak var qualificationsTextView: UITextView!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = TeacherController.shared.currentUser
            else { return }
        qualificationsTextView.text = user.qualifications
        aboutYouTextView.text = user.aboutMe

    }
    
    @IBAction func saveChangesButtonTapped(_ sender: Any) {
        guard let user = TeacherController.shared.currentUser, let newAboutMe = aboutYouTextView.text, !newAboutMe.isEmpty, let qualifications = qualificationsTextView.text, !qualifications.isEmpty else { return }
        TeacherController.shared.updateTeacherBiography(teacherDocRef: user.selfDocRef, aboutMe: newAboutMe, qualifications: qualifications) { (success) in
            if success {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
