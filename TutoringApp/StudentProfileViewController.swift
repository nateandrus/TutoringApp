//
//  StudentProfileViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class StudentProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var studentProfilePicture: UIImageView!
    @IBOutlet weak var studentNameLabel: UILabel!
    @IBOutlet weak var studentEmailLabel: UILabel!
    @IBOutlet weak var changeProfileButton: UIButton!
    
    var profileImage: UIImage? {
        didSet {
            studentProfilePicture.image = profileImage
            guard let user = StudentController.shared.currentUser, let newImage = profileImage else { return }
            StudentController.shared.changeProfileImage(userFirebaseUID: user.firebaseUID, newImage: newImage) { (success) in
                if success {
                    print("Success uploading photo to firebase storage")
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
        StudentController.shared.initializeStudent(firebaseUID: userFirebaseUID) { (success) in
            if success {
                guard let currentUser = StudentController.shared.currentUser else { return }
                self.studentNameLabel.text = currentUser.name
                self.studentEmailLabel.text = currentUser.email
                self.changeProfileButton.layer.cornerRadius = self.changeProfileButton.frame.height / 2
                StudentController.shared.loadProfileImageView(userFirebaseUID: currentUser.firebaseUID) { (image) in
                    self.studentProfilePicture.layer.cornerRadius = self.studentProfilePicture.frame.height / 2
                    if let image = image {
                        self.studentProfilePicture.image = image
                    } else {
                        self.studentProfilePicture.image = #imageLiteral(resourceName: "default user icon")
                    }
                }
            }
        }
    }
    
    @IBAction func changeProfileImageButtonTapped(_ sender: UIButton) {
        self.presentImagePickerActionSheet()
        guard let studentFirebaseUID = StudentController.shared.currentUser?.firebaseUID else { return }
        StudentController.shared.changeProfilePicture(userFirebaseUID: studentFirebaseUID, profileImage: self.profileImage)
    }
    
    @IBAction func changePasswordButtonClicked(_ sender: UIButton) {
        guard let user = StudentController.shared.currentUser else { return }
        StudentController.shared.updatePassword(email: user.email, completion: { (success, error) in
            if success {
                self.passwordAlertSuccess()
                print("SUCCESS SENDING PASSWORD RESET VERIFICATION EMAIL ✅✅✅✅✅✅")
            } else {
                print("FAILED SENDING PASSWORD RESET VERIFICATION EMAIL ❌❌❌❌❌❌")
            }
        })
        
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        StudentController.shared.signOutStudent(completion: { (success) in
            if success {
                let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                let loginScreen = storyBoard.instantiateViewController(withIdentifier: "loginScreen")
                self.present(loginScreen, animated: true)
            }
        })
    }
    
    @IBAction func deleteAccountButtonTapped(_ sender: UIButton) {
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
                let student = StudentController.shared.currentUser else { return }
            
            StudentController.shared.deleteStudent(user: user, student: student, completion: { (success) in
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

extension StudentProfileViewController {
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
