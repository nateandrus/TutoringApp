//
//  TeacherEditPreferencesViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class TeacherProfileViewController: UIViewController {
    
    @IBOutlet weak var teacherProfileScrollView: UIScrollView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    
    @IBOutlet weak var editSubjectsButton: UIButton!
    
    @IBOutlet weak var editPreferencesButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var meetingPrefLabel: UILabel!
    
    @IBOutlet weak var mondayAvailabilityLabel: UILabel!
    @IBOutlet weak var tuesdayAvailabilityLabel: UILabel!
    @IBOutlet weak var wednesdayAvailabilityLabel: UILabel!
    @IBOutlet weak var thursdayAvailabilityLabel: UILabel!
    @IBOutlet weak var fridayAvailabilityLabel: UILabel!
    @IBOutlet weak var saturdayAvailabilityLabel: UILabel!
    @IBOutlet weak var sundayAvailabilityLabel: UILabel!
    
    @IBOutlet weak var editBiographyButton: UIButton!
    @IBOutlet weak var preferencesStackView: UIStackView!
    
    var subjects: [String] = []
    var schedulePreference: [String] = []
    var meetingPreference: String = ""
    
    var changedProfileImage: UIImage? {
        didSet {
            profileImage.image = changedProfileImage
            guard let user = TeacherController.shared.currentUser, let newImage = changedProfileImage else { return }
            TeacherController.shared.changeProfileImage(userFirebaseUID: user.firebaseUID, newImage: newImage) { (success) in
                if success {
                    print("Success uploading photo to firebase storage")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = TeacherController.shared.currentUser
            else { return }
        TeacherController.shared.loadProfileImageView(userFirebaseUID: user.firebaseUID) { (image) in
            guard let image = image else { return }
            self.profileImage.image = image
        }
        
        priceLabel.text = user.costForTime
        meetingPreference = user.meetingPref
        nameLabel.text = user.name
        self.subjects = user.subjects
        schedulePreference = user.schedulePref
        
        if meetingPreference == "In Person" {
            meetingPrefLabel.text = "In Person"
        }
        if meetingPreference == "Online" {
            meetingPrefLabel.text = "Online"
        }
        if meetingPreference == "Both" {
            meetingPrefLabel.text = "In Person, Online"
        }
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        settingsActionSheet()
    }
    
    func settingsActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let changePasswordAction = UIAlertAction(title: "Change password", style: .default) { (_) in
            guard let teacher = TeacherController.shared.currentUser else { return }
            TeacherController.shared.changePassword(email: teacher.email, completion: { (success) in
                if success {
                    self.changePasswordEmailSent()
                }
            })
        }
        let changeProfileImageAction = UIAlertAction(title: "Change profile image", style: .default) { (_) in
            self.presentImagePickerActionSheet()
        }
        let logoutAction = UIAlertAction(title: "Logout", style: .default) { (_) in
            TeacherController.shared.logoutTeacher(completion: { (success) in
                if success {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let destinationVC = storyboard.instantiateViewController(withIdentifier: "loginScreen")
                    self.present(destinationVC, animated: true)
                }
            })
        }
        let deleteAccountAction = UIAlertAction(title: "Delete Account", style: .destructive) { (_) in
            self.deleteAccountAlertController()
        }
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(changePasswordAction)
        actionSheet.addAction(changeProfileImageAction)
        actionSheet.addAction(logoutAction)
        actionSheet.addAction(deleteAccountAction)
        present(actionSheet, animated: true)
    }
    
    func deleteAccountAlertController() {
        let alertController = UIAlertController(title: "Are you sure you want to delete your account?", message: "Deleting your account will erase all memory that you ever existed!", preferredStyle: .alert)
        let dontDeleteAction = UIAlertAction(title: "Don't delete", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete Account", style: .destructive) { (_) in
            
        }
        alertController.addAction(dontDeleteAction)
        alertController.addAction(deleteAction)
        present(alertController, animated: true)
    }
    
    func changePasswordEmailSent() {
        let alertController = UIAlertController(title: "Email sent!", message: "We have sent you an email with a link to change/reset your password.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
    
}

///MARK: - UIImagePickerDelegate
extension TeacherProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            changedProfileImage = photo
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
