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
    @IBOutlet weak var linkedInLabel: UILabel!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var subjectsStackView: UIStackView!
    @IBOutlet weak var subjectsStackView1: UIStackView!
    @IBOutlet weak var subjectsStackView2: UIStackView!
    @IBOutlet weak var subjectsStackView3: UIStackView!
    @IBOutlet weak var subjectsStackView4: UIStackView!
    
    @IBOutlet weak var accountingButton: UIButton!
    @IBOutlet weak var businessManagementButton: UIButton!
    @IBOutlet weak var economicsButton: UIButton!
    @IBOutlet weak var entrepreneurshipButton: UIButton!
    @IBOutlet weak var marketingButton: UIButton!
    @IBOutlet weak var salesButton: UIButton!
    @IBOutlet weak var androidDevelopmentButton: UIButton!
    @IBOutlet weak var htmlButton: UIButton!
    @IBOutlet weak var iosDevelopmentButton: UIButton!
    @IBOutlet weak var javascriptButton: UIButton!
    @IBOutlet weak var uxDesignButton: UIButton!
    @IBOutlet weak var webDevelopmentButton: UIButton!
    
    @IBOutlet weak var editSubjectsButton: UIButton!
    
    @IBOutlet weak var preferencesStackView: UIStackView!
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
    @IBOutlet weak var aboutYouLabel: UILabel!
    @IBOutlet weak var qualificationsLabel: UILabel!
    
    
    static let shared = TeacherProfileViewController()
    
    var isChangingProfileImage: Bool = false
    
    var subjects: [String] = []
    var schedulePreference: [String] = []
    var meetingPreference: String = ""
    
    var morning = "Morning"
    var afternoon = "Afternoon"
    var evening = "Evening"
    var blank = ""
    
    var changedProfileImage: UIImage? {
        didSet {
            guard let user = TeacherController.shared.currentUser, let newImage = changedProfileImage else { return }
            self.isChangingProfileImage = true
            TeacherController.shared.changeProfileImage(userFirebaseUID: user.firebaseUID, newImage: newImage) { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.profileImage.image = self.changedProfileImage
                        print("Success uploading photo to firebase storage")
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //zipcodeTextField.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        //changeProfileButton.layer.cornerRadius = changeProfileButton.frame.height / 2
        accountingButton.layer.cornerRadius = 5
        businessManagementButton.layer.cornerRadius = 5
        economicsButton.layer.cornerRadius = 5
        entrepreneurshipButton.layer.cornerRadius = 5
        marketingButton.layer.cornerRadius = 5
        salesButton.layer.cornerRadius = 5
        androidDevelopmentButton.layer.cornerRadius = 5
        htmlButton.layer.cornerRadius = 5
        iosDevelopmentButton.layer.cornerRadius = 5
        javascriptButton.layer.cornerRadius = 5
        uxDesignButton.layer.cornerRadius = 5
        webDevelopmentButton.layer.cornerRadius = 5
        guard let user = TeacherController.shared.currentUser else { return }
        if isChangingProfileImage == false {
            TeacherController.shared.loadProfileImageView(userFirebaseUID: user.firebaseUID) { (image) in
                guard let image = image else { return }
                self.profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
                self.profileImage.image = image
            }
        }
        
        self.navigationItem.title = "Profile"
        nameLabel.text = user.name
        linkedInLabel.text = user.linkedINLink
        subjects = user.subjects
        priceLabel.text = ("$\(user.costForTime)/hour")
        meetingPreference = user.meetingPref
        schedulePreference = user.schedulePref
        aboutYouLabel.text = user.aboutMe
        qualificationsLabel.text = user.qualifications
        
        if subjects.contains("Accounting") {
            accountingButton.isHidden = false
        } else {
            accountingButton.isHidden = true
        }
        
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
                if self.isChangingProfileImage == false {
                    TeacherController.shared.loadProfileImageView(userFirebaseUID: user.firebaseUID) { (image) in
                        guard let image = image else { return }
                        self.profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
                        self.profileImage.image = image
                    }
                }
                self.profileImage.image = user.profileImage
                self.nameLabel.text = user.name
                self.subjects = user.subjects
                self.priceLabel.text = ("$\(user.costForTime)/hour")
                self.meetingPrefLabel.text = user.meetingPref
                self.schedulePreference = user.schedulePref
                self.aboutYouLabel.text = user.aboutMe
                self.qualificationsLabel.text = user.qualifications
                
                if self.subjects.contains("Accounting") {
                    self.accountingButton.isHidden = false
                } else {
                    self.accountingButton.isHidden = true
                }
                if self.subjects.contains("Business Management") {
                    self.businessManagementButton.isHidden = false
                } else {
                    self.businessManagementButton.isHidden = true
                }
                if self.subjects.contains("Economics") {
                    self.economicsButton.isHidden = false
                } else {
                    self.economicsButton.isHidden = true
                }
                if self.subjects.contains("Accounting") || self.subjects.contains("Business Management") || self.subjects.contains("Economics") {
                    self.subjectsStackView1.isHidden = false
                } else {
                    self.subjectsStackView1.isHidden = true
                }
                if self.subjects.contains("Entrepreneurship") {
                    self.entrepreneurshipButton.isHidden = false
                } else {
                    self.entrepreneurshipButton.isHidden = true
                }
                if self.subjects.contains("Marketing") {
                    self.marketingButton.isHidden = false
                } else {
                    self.marketingButton.isHidden = true
                }
                if self.subjects.contains("Sales") {
                    self.salesButton.isHidden = false
                } else {
                    self.salesButton.isHidden = true
                }
                if self.subjects.contains("Entrepreneurship") || self.subjects.contains("Marketing") || self.subjects.contains("Sales") {
                    self.subjectsStackView2.isHidden = false
                } else {
                    self.subjectsStackView2.isHidden = true
                }
                if self.subjects.contains("Android Development") {
                    self.androidDevelopmentButton.isHidden = false
                } else {
                    self.androidDevelopmentButton.isHidden = true
                }
                if self.subjects.contains("HTML") {
                    self.htmlButton.isHidden = false
                } else {
                    self.htmlButton.isHidden = true
                }
                if self.subjects.contains("iOS Development") {
                    self.iosDevelopmentButton.isHidden = false
                } else {
                    self.iosDevelopmentButton.isHidden = true
                }
                if self.subjects.contains("Android Development") || self.subjects.contains("HTML") || self.subjects.contains("iOS Development") {
                    self.subjectsStackView3.isHidden = false
                } else {
                    self.subjectsStackView3.isHidden = true
                }
                if self.subjects.contains("Javascript") {
                    self.javascriptButton.isHidden = false
                } else {
                    self.javascriptButton.isHidden = true
                }
                if self.subjects.contains("UX Design") {
                    self.uxDesignButton.isHidden = false
                } else {
                    self.uxDesignButton.isHidden = true
                }
                if self.subjects.contains("Web Development") {
                    self.webDevelopmentButton.isHidden = false
                } else {
                    self.webDevelopmentButton.isHidden = true
                }
                if self.subjects.contains("Javascript") || self.subjects.contains("UX Design") || self.subjects.contains("Web Development") {
                    self.subjectsStackView4.isHidden = false
                } else {
                    self.subjectsStackView4.isHidden = true
                }
                
                
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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isChangingProfileImage = false
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
        settingsActionSheet()
    }
    
//    @IBAction func changeProfileImageButtonTapped(_ sender: UIButton) {
//        self.presentImagePickerActionSheet()
//        guard let teacherFirebaseUID = TeacherController.shared.currentUser?.firebaseUID else { return }
//        TeacherController.shared.changeProfileImage(userFirebaseUID: teacherFirebaseUID, newImage: self.changedProfileImage)
//    }
    
    func settingsActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        let changeLinkedInAction = UIAlertAction(title: "Change LinkedIn Link", style: .default) { (_) in
//            guard let
//        }
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
            guard let user = Auth.auth().currentUser, let teacher = TeacherController.shared.currentUser else { return }
            TeacherController.shared.deleteTeacher(user: user, teacher: teacher, completion: { (success) in
                if success {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let destinationVC = storyboard.instantiateViewController(withIdentifier: "loginScreen")
                    self.present(destinationVC, animated: true)
                }
            })
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
