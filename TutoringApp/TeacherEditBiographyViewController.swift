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
    @IBOutlet weak var linkedInTextField: UITextField!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutYouTextView.layer.cornerRadius = 5
        aboutYouTextView.layer.borderWidth = 2
        aboutYouTextView.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        qualificationsTextView.layer.cornerRadius = 5
        qualificationsTextView.layer.borderWidth = 2
        qualificationsTextView.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        linkedInTextField.layer.cornerRadius = 5
        linkedInTextField.layer.borderWidth = 2
        linkedInTextField.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        saveChangesButton.layer.cornerRadius = 5
        guard let user = TeacherController.shared.currentUser
            else { return }
        qualificationsTextView.text = user.qualifications
        aboutYouTextView.text = user.aboutMe
        linkedInTextField.text = user.linkedINLink

    }
    
    @IBAction func saveChangesButtonTapped(_ sender: Any) {
        guard let user = TeacherController.shared.currentUser, let newAboutMe = aboutYouTextView.text, !newAboutMe.isEmpty, let qualifications = qualificationsTextView.text, !qualifications.isEmpty, let linkedInLink = linkedInTextField.text, !linkedInLink.isEmpty else { return }
        TeacherController.shared.updateTeacherBiography(teacherDocRef: user.selfDocRef, aboutMe: newAboutMe, qualifications: qualifications, linkedINLink: linkedInLink) { (success) in
            if success {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
