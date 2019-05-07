//
//  DriversLicenseViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class DriversLicenseViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var licenseImageView: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    
    var licenseImage: UIImage? {
        didSet {
            licenseImageView.image = licenseImage
            addPhotoButton.setTitle("", for: .normal)
        }
    }
    
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
    var aboutMe: String?
    var qualifications: String?
    var linkedIn: String?
    var userFirebaseUID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = submitButton.frame.height / 2 
    }
    
    @IBAction func addLicensePhotoButtonTapped(_ sender: UIButton) {
        presentImagePickerActionSheet()
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        guard let name = nameLandingPad, let email = email, let location = location, let dateOfBirth = dateOfBirth, let subjects = subjectsLanding, let costPerHour = costPerHour, let schedulePref = schedulePreference, let meetingPref = meetingPreference, let aboutMe = aboutMe, let qualifications = qualifications, let linkedInLink = linkedIn, let userFirebaseUID = userFirebaseUID
            else { return }
        
        TeacherController.shared.createTeacher(name: name, email: email, location: location, messages: [], dateOfBirth: dateOfBirth, subjects: subjects, costPerHour: costPerHour, schedulePreference: schedulePref, meetingPreference: meetingPref, aboutMe: aboutMe, qualifications: qualifications, linkedInLink: linkedInLink, userFirebaseUID: userFirebaseUID, profileImage: profileImage) { (success) in
            if success {
                let mainVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TeacherTabBar")
                self.present(mainVC, animated: true)
            }
        }
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
        skipAlertController()
    }
    
    func skipAlertController() {
        let alertController = UIAlertController(title: "Skip this step?", message: "Security is one of our most important features, to ensure the safety of all of our users we verify the mentors to make sure that they are who they say they are. You may pass without taking a picture, but your account will not be verified.", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let continueAction = UIAlertAction(title: "Finish creating Account", style: .default) { (_) in
            //create mentor
        }
        alertController.addAction(cancelAction)
        alertController.addAction(continueAction)
        present(alertController, animated: true)
    }
}

///MARK: - UIImagePickerDelegate
extension DriversLicenseViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            licenseImage = photo
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func presentImagePickerActionSheet() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        let actionSheet = UIAlertController(title: "Select a Photo", message: nil, preferredStyle: .actionSheet)
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            actionSheet.popoverPresentationController?.sourceView = self.view
            actionSheet.popoverPresentationController?.sourceRect = CGRect(x: 50, y: self.view.frame.height - 100, width: self.view.frame.width - 100, height: 100)
            actionSheet.addAction(UIAlertAction(title: "Photos", style: .default, handler: { (_) in
                imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            actionSheet.popoverPresentationController?.sourceView = self.view
            actionSheet.popoverPresentationController?.sourceRect = CGRect(x: 50, y: self.view.frame.height - 100, width: self.view.frame.width - 100, height: 100)
            actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (_) in
                imagePickerController.sourceType = UIImagePickerController.SourceType.camera
                self.present(imagePickerController, animated: true, completion: nil)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
}
