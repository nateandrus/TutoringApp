//
//  TeacherEditPreferencesViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class TeacherProfileViewController: UIViewController {
    
    @IBOutlet weak var teacherProfileScrollView: UIScrollView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var subjectsStackView: UIStackView!
    @IBOutlet weak var subjectBox1: UIButton!
    @IBOutlet weak var subjectBox2: UIButton!
    @IBOutlet weak var subjectBox3: UIButton!
    @IBOutlet weak var subjectBox4: UIButton!
    @IBOutlet weak var subjectBox5: UIButton!
    @IBOutlet weak var subjectBox6: UIButton!
    @IBOutlet weak var subjectBox7: UIButton!
    @IBOutlet weak var subjectBox8: UIButton!
    @IBOutlet weak var subjectBox9: UIButton!
    @IBOutlet weak var subjectBox10: UIButton!
    @IBOutlet weak var subjectBox11: UIButton!
    @IBOutlet weak var subjectBox12: UIButton!
    
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
    
    var morning = "Morning"
    var afternoon = "Afternoon"
    var evening = "Evening"
    var blank = ""
        
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
        guard let user = TeacherController.shared.currentUser else { return }
        TeacherController.shared.loadProfileImageView(userFirebaseUID: user.firebaseUID) { (image) in
            guard let image = image else { return }
            self.profileImage.image = image
        }
        
        nameLabel.text = user.name
        subjects = user.subjects
        subjectBox1.titleLabel?.text = "iOS"
        subjectBox2.titleLabel?.text = "Android"
        priceLabel.text = ("$\(user.costForTime)/hour")
        meetingPreference = user.meetingPref
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
        if schedulePreference.contains("MondayMorning") {
            mondayAvailabilityLabel.text = "Morning"
        }
        if schedulePreference.contains("MondayAfternoon") {
            mondayAvailabilityLabel.text = "Afternoon"
        }
        if schedulePreference.contains("MondayEvening") {
            mondayAvailabilityLabel.text = "Evening"
        }
        if schedulePreference.contains("TuesdayMorning") {
            tuesdayAvailabilityLabel.text = "Morning"
        }
        if schedulePreference.contains("TuesdayAfternoon") {
            tuesdayAvailabilityLabel.text = "Afternoon"
        }
        if schedulePreference.contains("TuesdayEvening") {
            tuesdayAvailabilityLabel.text = "Evening"
        }
        if schedulePreference.contains("WednesdayMorning") {
            wednesdayAvailabilityLabel.text = "Morning"
        }
        if schedulePreference.contains("WednesdayAfternoon") {
            wednesdayAvailabilityLabel.text = "Afternoon"
        }
        if schedulePreference.contains("WednesdayEvening") {
            wednesdayAvailabilityLabel.text = "Evening"
        }
        if schedulePreference.contains("ThursdayMorning") {
            thursdayAvailabilityLabel.text = "Morning"
        }
        if schedulePreference.contains("ThursdayAfternoon") {
            thursdayAvailabilityLabel.text = "Afternoon"
        }
        if schedulePreference.contains("ThursdayEvening") {
            thursdayAvailabilityLabel.text = "Evening"
        }
        if schedulePreference.contains("FridayMorning") {
            fridayAvailabilityLabel.text = "Morning"
        }
        if schedulePreference.contains("FridayAfternoon") {
            fridayAvailabilityLabel.text = "Afternoon"
        }
        if schedulePreference.contains("FridayEvening") {
            fridayAvailabilityLabel.text = "Evening"
        }
        if schedulePreference.contains("SaturdayMorning") {
            saturdayAvailabilityLabel.text = "Morning"
        }
        if schedulePreference.contains("SaturdayAfternoon") {
            saturdayAvailabilityLabel.text = "Afternoon"
        }
        if schedulePreference.contains("SaturdayEvening") {
            saturdayAvailabilityLabel.text = "Evening"
        }
        if schedulePreference.contains("SundayMorning") {
            sundayAvailabilityLabel.text = "Morning"
        }
        if schedulePreference.contains("SundayAfternoon") {
            sundayAvailabilityLabel.text = "Afternoon"
        }
        if schedulePreference.contains("SundayEvening") {
            sundayAvailabilityLabel.text = "Evening"
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let id = Auth.auth().currentUser?.uid else { return }
        TeacherController.shared.initializeTeacher(firebaseUID: id) { (success) in
            if success {
                guard let user = TeacherController.shared.currentUser else { return }
                TeacherController.shared.loadProfileImageView(userFirebaseUID: user.firebaseUID) { (image) in
                    guard let image = image else { return }
                    self.profileImage.image = image
                }
                self.profileImage.image = user.profileImage
                self.nameLabel.text = user.name
                self.subjects = user.subjects
                self.subjectBox1.titleLabel?.text = "IOS"
                self.priceLabel.text = ("$\(user.costForTime)/hour")
                self.meetingPrefLabel.text = user.meetingPref
                self.schedulePreference = user.schedulePref
                
                if user.meetingPref == "Both" {
                    self.meetingPrefLabel.text = "In Person/Online"
                }
                
                if self.schedulePreference.contains("MondayMorning") {
                    self.mondayAvailabilityLabel.text = self.morning
                }
                if self.schedulePreference.contains("MondayAfternoon") {
                    self.mondayAvailabilityLabel.text = self.afternoon
                }
                if self.schedulePreference.contains("MondayEvening") {
                    self.mondayAvailabilityLabel.text = self.evening
                }
                if self.schedulePreference.contains("MondayMorning") && self.schedulePreference.contains("MondayAfternoon") {
                    self.mondayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)"
                }
                if self.schedulePreference.contains("MondayMorning") && self.schedulePreference.contains("MondayEvening") {
                    self.mondayAvailabilityLabel.text = "\(self.morning)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("MondayAfternoon") && self.schedulePreference.contains("MondayEvening") {
                    self.mondayAvailabilityLabel.text = "\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("MondayMorning") && self.schedulePreference.contains("MondayAfternoon") && self.schedulePreference.contains("MondayEvening") {
                    self.mondayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("TuesdayMorning") {
                    self.tuesdayAvailabilityLabel.text = self.morning
                }
                if self.schedulePreference.contains("TuesdayAfternoon") {
                    self.tuesdayAvailabilityLabel.text = self.afternoon
                }
                if self.schedulePreference.contains("TuesdayEvening") {
                    self.tuesdayAvailabilityLabel.text = self.evening
                }
                if self.schedulePreference.contains("TuesdayMorning") && self.schedulePreference.contains("TuesdayAfternoon") {
                    self.tuesdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)"
                }
                if self.schedulePreference.contains("TuesdayMorning") && self.schedulePreference.contains("TuesdayEvening") {
                    self.tuesdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("TuesdayAfternoon") && self.schedulePreference.contains("TuesdayEvening") {
                    self.tuesdayAvailabilityLabel.text = "\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("TuesdayMorning") && self.schedulePreference.contains("TuesdayAfternoon") && self.schedulePreference.contains("TuesdayEvening") {
                    self.tuesdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("WednesdayMorning") {
                    self.wednesdayAvailabilityLabel.text = self.morning
                }
                if self.schedulePreference.contains("WednesdayAfternoon") {
                    self.wednesdayAvailabilityLabel.text = self.afternoon
                }
                if self.schedulePreference.contains("WednesdayEvening") {
                    self.wednesdayAvailabilityLabel.text = self.evening
                }
                if self.schedulePreference.contains("WednesdayMorning") && self.schedulePreference.contains("WednesdayAfternoon") {
                    self.wednesdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)"
                }
                if self.schedulePreference.contains("WednesdayMorning") && self.schedulePreference.contains("WednesdayEvening") {
                    self.wednesdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("WednesdayAfternoon") && self.schedulePreference.contains("WednesdayEvening") {
                    self.wednesdayAvailabilityLabel.text = "\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("WednesdayMorning") && self.schedulePreference.contains("WednesdayAfternoon") && self.schedulePreference.contains("WednesdayEvening") {
                    self.wednesdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("ThursdayMorning") {
                    self.thursdayAvailabilityLabel.text = self.morning
                }
                if self.schedulePreference.contains("ThursdayAfternoon") {
                    self.thursdayAvailabilityLabel.text = self.afternoon
                }
                if self.schedulePreference.contains("ThursdayEvening") {
                    self.thursdayAvailabilityLabel.text = self.evening
                }
                if self.schedulePreference.contains("ThursdayMorning") && self.schedulePreference.contains("ThursdayAfternoon") {
                    self.thursdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)"
                }
                if self.schedulePreference.contains("ThursdayMorning") && self.schedulePreference.contains("ThursdayEvening") {
                    self.thursdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("ThursdayAfternoon") && self.schedulePreference.contains("ThursdayEvening") {
                    self.thursdayAvailabilityLabel.text = "\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("ThursdayMorning") && self.schedulePreference.contains("ThursdayAfternoon") && self.schedulePreference.contains("ThursdayEvening") {
                    self.thursdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("FridayMorning") {
                    self.fridayAvailabilityLabel.text = self.morning
                }
                if self.schedulePreference.contains("FridayAfternoon") {
                    self.fridayAvailabilityLabel.text = self.afternoon
                }
                if self.schedulePreference.contains("FridayEvening") {
                    self.fridayAvailabilityLabel.text = self.evening
                }
                if self.schedulePreference.contains("FridayMorning") && self.schedulePreference.contains("FridayAfternoon") {
                    self.fridayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)"
                }
                if self.schedulePreference.contains("FridayMorning") && self.schedulePreference.contains("FridayEvening") {
                    self.fridayAvailabilityLabel.text = "\(self.morning)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("FridayAfternoon") && self.schedulePreference.contains("FridayEvening") {
                    self.fridayAvailabilityLabel.text = "\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("FridayMorning") && self.schedulePreference.contains("FridayAfternoon") && self.schedulePreference.contains("FridayEvening") {
                    self.fridayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("SaturdayMorning") {
                    self.saturdayAvailabilityLabel.text = self.morning
                }
                if self.schedulePreference.contains("SaturdayAfternoon") {
                    self.saturdayAvailabilityLabel.text = self.afternoon
                }
                if self.schedulePreference.contains("SaturdayEvening") {
                    self.saturdayAvailabilityLabel.text = self.evening
                }
                if self.schedulePreference.contains("SaturdayMorning") && self.schedulePreference.contains("SaturdayAfternoon") {
                    self.saturdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)"
                }
                if self.schedulePreference.contains("SaturdayMorning") && self.schedulePreference.contains("SaturdayEvening") {
                    self.saturdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("SaturdayAfternoon") && self.schedulePreference.contains("SaturdayEvening") {
                    self.saturdayAvailabilityLabel.text = "\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("SaturdayMorning") && self.schedulePreference.contains("SaturdayAfternoon") && self.schedulePreference.contains("SaturdayEvening") {
                    self.saturdayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("SundayMorning") {
                    self.sundayAvailabilityLabel.text = self.morning
                }
                if self.schedulePreference.contains("SundayAfternoon") {
                    self.sundayAvailabilityLabel.text = self.afternoon
                }
                if self.schedulePreference.contains("SundayEvening") {
                    self.sundayAvailabilityLabel.text = self.evening
                }
                if self.schedulePreference.contains("SundayMorning") && self.schedulePreference.contains("SundayAfternoon") {
                    self.sundayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)"
                }
                if self.schedulePreference.contains("SundayMorning") && self.schedulePreference.contains("SundayEvening") {
                    self.sundayAvailabilityLabel.text = "\(self.morning)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("SundayAfternoon") && self.schedulePreference.contains("SundayEvening") {
                    self.sundayAvailabilityLabel.text = "\(self.afternoon)" + "/\(self.evening)"
                }
                if self.schedulePreference.contains("SundayMorning") && self.schedulePreference.contains("SundayAfternoon") && self.schedulePreference.contains("SundayEvening") {
                    self.sundayAvailabilityLabel.text = "\(self.morning)" + "/\(self.afternoon)" + "/\(self.evening)"
                }
                
            }
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
