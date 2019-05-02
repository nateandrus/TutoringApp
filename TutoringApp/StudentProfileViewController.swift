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
        guard let currentUser = StudentController.shared.currentUser else { return }
        studentNameLabel.text = currentUser.name
        studentEmailLabel.text = currentUser.email
        self.title = currentUser.name
        StudentController.shared.loadProfileImageView(userFirebaseUID: currentUser.firebaseUID) { (image) in
            guard let image = image else { return }
            self.studentProfilePicture.layer.cornerRadius = self.studentProfilePicture.frame.height / 2
            self.studentProfilePicture.image = image
        }
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func settingsButtonTapped(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let changeProfilePicture = UIAlertAction(title: "Change Profile Picture", style: .default) { action in
            self.presentImagePickerActionSheet()
            guard let studentFirebaseUID = StudentController.shared.currentUser?.firebaseUID else { return }
            StudentController.shared.changeProfilePicture(userFirebaseUID: studentFirebaseUID, profileImage: self.profileImage)
        }
        
        let changePassword = UIAlertAction(title: "Change Password", style: .default) { action in
            guard let user = StudentController.shared.currentUser else { return }
            StudentController.shared.updatePassword(email: user.email, completion: { (success) in
                if success {
                    print("SUCCESS SENDING PASSWORD RESET VERIFICATION EMAIL ✅✅✅✅✅✅")
                } else {
                    print("FAILED SENDING PASSWORD RESET VERIFICATION EMAIL ❌❌❌❌❌❌")
                }
            })
        }
        
        let logOut = UIAlertAction(title: "Log Out", style: .default) { action in
            StudentController.shared.signOutStudent(completion: { (success) in
                if success {
                    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let loginScreen = storyBoard.instantiateViewController(withIdentifier: "loginScreen")
                    self.present(loginScreen, animated: true)
                }
            })
        }
        
        let delete = UIAlertAction(title: "Delete Account", style: .destructive) { action in
            self.deleteAlert()
            guard let user = Auth.auth().currentUser,
                let student = StudentController.shared.currentUser else { return }
            
            StudentController.shared.deleteStudent(user: user, student: student, completion: { (success) in
                if success {
                    print("SUCCESS DELETING USER ✅✅✅✅✅✅")
                }
            })
        }
        
        actionSheet.addAction(changePassword)
        actionSheet.addAction(changeProfilePicture)
        actionSheet.addAction(logOut)
        actionSheet.addAction(delete)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func deleteAlert() {
        let alert = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete your account?", preferredStyle: .alert)
        let confirmDelete = UIAlertAction(title: "Delete", style: .destructive, handler: nil)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(confirmDelete)
        alert.addAction(cancel)
        
        present(alert, animated: true)
    }
    
    @IBAction func changeProfilePictureButtonTapped(_ sender: Any) {
    }
    
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
    }
}

extension StudentProfileViewController { //UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
