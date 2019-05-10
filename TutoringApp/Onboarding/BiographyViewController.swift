//
//  BiographyViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class BiographyViewController: UIViewController, UITextViewDelegate, UITextFieldDelegate {

    //MARK: - Outlets
    @IBOutlet weak var aboutMeTextView: UITextView!
    @IBOutlet weak var qualificationsTextView: UITextView!
    @IBOutlet weak var linkedInTextField: UITextField!
    @IBOutlet weak var nextStepButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    //LandingPads
    var nameLandingPad: String?
    var email: String?
    var profileImage: UIImage?
    var location: String?
    var dateOfBirth: String?
    var subjectsLanding: [String]?
    var costPerHour: Int?
    var schedulePreference: [String]?
    var meetingPreference: String?
    var userFirebaseUID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatKeyboard()
        aboutMeTextView.layer.cornerRadius = 5
        aboutMeTextView.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        aboutMeTextView.layer.borderWidth = 2
        qualificationsTextView.layer.cornerRadius = 5
        qualificationsTextView.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        qualificationsTextView.layer.borderWidth = 2
        nextStepButton.layer.cornerRadius = 5
        aboutMeTextView.delegate = self
        qualificationsTextView.delegate = self
        linkedInTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    

    func formatKeyboard() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
            guard let userInfo = notification.userInfo,
                let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
            self.bottomConstraint.constant += keyboardFrame.height
            self.view.layoutSubviews()
            let frameInContentView = self.qualificationsTextView.convert(self.qualificationsTextView.bounds, to: self.contentView)
            let offSetPoint = CGPoint(x: self.contentView.frame.origin.x, y: frameInContentView.origin.y - frameInContentView.height)
            self.scrollView.setContentOffset(offSetPoint, animated: true)
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { (notification) in
            self.bottomConstraint.constant = 0
        }
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toLicenseVC" {
            guard let qualifications = qualificationsTextView.text, !qualifications.isEmpty, let experiences = aboutMeTextView.text, !experiences.isEmpty else {
                alertController()
                return false
            }
        }
        return true
    }
    func alertController() {
        let alertController = UIAlertController(title: "You shall not pass!", message: "Looks like you are missing some information on this page, it is important that mentees are able to see your experience and qualifications!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLicenseVC" {
            guard let name = nameLandingPad, let email = email, let location = location, let dateofBirth = dateOfBirth, let subjects = subjectsLanding, let costPerHour = costPerHour, let meetingPreference = meetingPreference, let schedulePreference = schedulePreference, let aboutMe = aboutMeTextView.text, let qualifications = qualificationsTextView.text, let userFirebaseUID = userFirebaseUID else { return }
            if let destinationVC = segue.destination as? DriversLicenseViewController {
                destinationVC.nameLandingPad = name
                destinationVC.email = email
                destinationVC.location = location
                destinationVC.dateOfBirth = dateofBirth
                destinationVC.profileImage = profileImage
                destinationVC.subjectsLanding = subjects
                destinationVC.costPerHour = costPerHour
                destinationVC.meetingPreference = meetingPreference
                destinationVC.schedulePreference = schedulePreference
                destinationVC.aboutMe = aboutMe
                destinationVC.qualifications = qualifications
                destinationVC.linkedIn = linkedInTextField.text
                destinationVC.userFirebaseUID = userFirebaseUID
            }
        }
    }
}
