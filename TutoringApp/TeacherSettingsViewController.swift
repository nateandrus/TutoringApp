//
//  TeacherSettingsViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 5/8/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class TeacherSettingsViewController: UIViewController {

    @IBOutlet weak var teacherProfileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var changeProfileImageButton: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var deleteAccountButton: UIButton!
    
    var isChangingProfileImage: Bool = false
    
    var profileImage: UIImage? {
        didSet {
            guard let user = TeacherController.shared.currentUser, let newImage = profileImage else { return }
            self.isChangingProfileImage = true
            TeacherController.shared.changeProfileImage(userFirebaseUID: user.firebaseUID, newImage: newImage) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.teacherProfileImage.image = self.profileImage
                        print("Success uploading photo to firebase storage")
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let userFirebaseUID = Auth.auth().currentUser?.uid else { return }
        TeacherController.shared.initializeTeacher(firebaseUID: userFirebaseUID) { (success) in
            if success {
                guard let currentUser = TeacherController.shared.currentUser else { return }
                self.nameLabel.text = currentUser.name
                self.emailLabel.text = currentUser.email
                self.changeProfileImageButton.layer.cornerRadius = self.changeProfileImageButton.frame.height / 2
                if self.isChangingProfileImage == false {
                    TeacherController.shared.loadProfileImageView(userFirebaseUID: currentUser.firebaseUID) { (image) in
                        self.teacherProfileImage.layer.cornerRadius = self.teacherProfileImage.frame.height / 2
                        if let image = image {
                            self.teacherProfileImage.image = image
                        } else {
                            self.teacherProfileImage.image = #imageLiteral(resourceName: "default user icon")
                        }
                    }
                    
                }
            }
        }
    }
    
    @IBAction func changeProfileImageButtonTapped(_ sender: Any) {
        presentImagePickerActionSheet()
    }
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
        guard let user = TeacherController.shared.currentUser else { return }
        TeacherController.shared.changePassword(email: user.email, completion: { (success) in
            if success {
                self.passwordAlertSuccess()
                print("SUCCESS SENDING PASSWORD RESET VERIFICATION EMAIL ✅✅✅✅✅✅")
            } else {
                print("FAILED SENDING PASSWORD RESET VERIFICATION EMAIL ❌❌❌❌❌❌")
            }
        })
    }
    @IBAction func logOutButtonTapped(_ sender: Any) {
        TeacherController.shared.logoutTeacher(completion: { (success) in
            if success {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let loginScreen = storyBoard.instantiateViewController(withIdentifier: "loginScreen")
                self.present(loginScreen, animated: true)
            }
        })
    }
    @IBAction func deleteAccountButtonTapped(_ sender: Any) {
        self.deleteAlert()
    }
    
    func passwordAlertSuccess() {
        let alertController = UIAlertController(title: "Success", message: "An email has been sent to you with steps to reset your password!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
    
    func deleteAlert() {
        let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete your account?", preferredStyle: .alert)
        let confirmDelete = UIAlertAction(title: "Confirm Delete", style: .destructive) { (_) in
            guard let user = Auth.auth().currentUser,
                let teacher = TeacherController.shared.currentUser else { return }
            
            TeacherController.shared.deleteTeacher(user: user, teacher: teacher, completion: { (success) in
                if success {
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let loginScreen = storyBoard.instantiateViewController(withIdentifier: "loginScreen")
                    self.present(loginScreen, animated: true)
                    print("SUCCESS DELETING USER ✅✅✅✅✅✅")
                }
            })
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(confirmDelete)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
}
///MARK: - UIImagePickerDelegate
extension TeacherSettingsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let photo = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage = photo
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
