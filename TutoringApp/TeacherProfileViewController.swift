//
//  TeacherEditPreferencesViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class TeacherProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var teacherProfileScrollView: UIScrollView!
    
    @IBOutlet weak var changeSubjectsButton: UIButton!
    @IBOutlet weak var subjectsStackView: UIStackView!
    @IBOutlet weak var businessManagementButton: UIButton!
    @IBOutlet weak var accountingButton: UIButton!
    @IBOutlet weak var marketingButton: UIButton!
    @IBOutlet weak var productManagementButton: UIButton!
    @IBOutlet weak var entrepreneurshipButton: UIButton!
    @IBOutlet weak var economicsButton: UIButton!
    @IBOutlet weak var webDevelopmentButton: UIButton!
    @IBOutlet weak var uxDesignButton: UIButton!
    @IBOutlet weak var iosDevelopmentButton: UIButton!
    @IBOutlet weak var javascriptButton: UIButton!
    @IBOutlet weak var pythonButton: UIButton!
    @IBOutlet weak var softwareEngineerButton: UIButton!
    
    @IBOutlet weak var changePreferencesButton: UIButton!
    @IBOutlet weak var preferencesStackView: UIStackView!
    @IBOutlet weak var priceTextfield: UITextField!
    @IBOutlet weak var mondayMorningButton: UIButton!
    @IBOutlet weak var mondayAfternoonButton: UIButton!
    @IBOutlet weak var mondayEveningButton: UIButton!
    @IBOutlet weak var tuesdayMorningButton: UIButton!
    @IBOutlet weak var tuesdayAfternoonButton: UIButton!
    @IBOutlet weak var tuesdayEveningButton: UIButton!
    @IBOutlet weak var wednesdayMorningButton: UIButton!
    @IBOutlet weak var wednesdayAfternoonButton: UIButton!
    @IBOutlet weak var wednesdayEveningButton: UIButton!
    @IBOutlet weak var thursdayMorningButton: UIButton!
    @IBOutlet weak var thursdayAfternoonButton: UIButton!
    @IBOutlet weak var thursdayEveningButton: UIButton!
    @IBOutlet weak var fridayMorningButton: UIButton!
    @IBOutlet weak var fridayAfternoonButton: UIButton!
    @IBOutlet weak var fridayEveningButton: UIButton!
    @IBOutlet weak var saturdayMorningButton: UIButton!
    @IBOutlet weak var saturdayAfternoonButton: UIButton!
    @IBOutlet weak var saturdayEveningButton: UIButton!
    @IBOutlet weak var sundayMorningButton: UIButton!
    @IBOutlet weak var sundayAfternoonButton: UIButton!
    @IBOutlet weak var sundayEveningButton: UIButton!
    
    @IBOutlet weak var localButton: UIButton!
    @IBOutlet weak var onlineButton: UIButton!
    @IBOutlet weak var bothButton: UIButton!
    
    @IBOutlet weak var changeBiographyButton: UIButton!
    @IBOutlet weak var biographyStackView: UIStackView!
    @IBOutlet weak var aboutYouTextView: UITextView!
    @IBOutlet weak var qualificationsTextView: UITextView!
    
    @IBOutlet weak var saveChangesButton: UIButton!
    
    var subjects: [String] = []
    var schedulePreference: [String] = []
    var meetingPreference: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectsStackView.isHidden = true
        preferencesStackView.isHidden = true
        biographyStackView.isHidden = true
        localButton.backgroundColor = .lightGray
        onlineButton.backgroundColor = .lightGray
        bothButton.backgroundColor = .lightGray
        
        guard let user = TeacherController.shared.currentUser
            else { return }
        priceTextfield.text = user.costForTime
        meetingPreference = user.meetingPref
        nameLabel.text = user.name
        emailLabel.text = user.email
        self.subjects = user.subjects
        schedulePreference = user.schedulePref
        qualificationsTextView.text = user.qualifications
        aboutYouTextView.text = user.aboutMe
        
        if subjects.contains("Business Management") {
            businessManagementButton.backgroundColor = .black
            businessManagementButton.setTitleColor(.white, for: .normal)
        } else {
            businessManagementButton.backgroundColor = .lightGray
            businessManagementButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Accounting") {
            accountingButton.backgroundColor = .black
            accountingButton.setTitleColor(.white, for: .normal)
        } else {
            accountingButton.backgroundColor = .lightGray
            accountingButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Marketing") {
            marketingButton.backgroundColor = .black
            marketingButton.setTitleColor(.white, for: .normal)
        } else {
            marketingButton.backgroundColor = .lightGray
            marketingButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Product Management") {
            productManagementButton.backgroundColor = .black
            productManagementButton.setTitleColor(.white, for: .normal)
        } else {
            productManagementButton.backgroundColor = .lightGray
            productManagementButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Entrepreneurship") {
            entrepreneurshipButton.backgroundColor = .black
            entrepreneurshipButton.setTitleColor(.white, for: .normal)
        } else {
            entrepreneurshipButton.backgroundColor = .lightGray
            entrepreneurshipButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("iOS Development") {
            iosDevelopmentButton.backgroundColor = .black
            iosDevelopmentButton.setTitleColor(.white, for: .normal)
        } else {
            iosDevelopmentButton.backgroundColor = .lightGray
            iosDevelopmentButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Web Development") {
            webDevelopmentButton.backgroundColor = .black
            webDevelopmentButton.setTitleColor(.white, for: .normal)
        } else {
            webDevelopmentButton.backgroundColor = .lightGray
            webDevelopmentButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("UX Design") {
            uxDesignButton.backgroundColor = .black
            uxDesignButton.setTitleColor(.white, for: .normal)
        } else {
            uxDesignButton.backgroundColor = .lightGray
            uxDesignButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Javascript") {
            javascriptButton.backgroundColor = .black
            javascriptButton.setTitleColor(.white, for: .normal)
        } else {
            javascriptButton.backgroundColor = .lightGray
            javascriptButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Python") {
            pythonButton.backgroundColor = .black
            pythonButton.setTitleColor(.white, for: .normal)
        } else {
            pythonButton.backgroundColor = .lightGray
            pythonButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Software Development") {
            softwareEngineerButton.backgroundColor = .black
            softwareEngineerButton.setTitleColor(.white, for: .normal)
        } else {
            softwareEngineerButton.backgroundColor = .lightGray
            softwareEngineerButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Economics") {
            economicsButton.backgroundColor = .black
            economicsButton.setTitleColor(.white, for: .normal)
        } else {
            economicsButton.backgroundColor = .lightGray
            economicsButton.setTitleColor(.black, for: .normal)
        }
        if schedulePreference.contains("MondayMorning") {
            mondayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            mondayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("MondayAfternoon") {
            mondayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            mondayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("MondayEvening") {
            mondayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            mondayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("TuesdayMorning") {
            tuesdayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            tuesdayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("TuesdayAfternoon") {
            tuesdayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            tuesdayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("TuesdayEvening") {
            tuesdayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            tuesdayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("WednesdayMorning") {
            wednesdayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            wednesdayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("WednesdayAfternoon") {
            wednesdayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            wednesdayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("WednesdayEvening") {
            wednesdayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            wednesdayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("ThursdayMorning") {
            thursdayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            thursdayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("ThursdayAfternoon") {
            thursdayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            thursdayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("ThursdayEvening") {
            thursdayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            thursdayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("FridayMorning") {
            fridayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            fridayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("FridayAfternoon") {
            fridayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            fridayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("FridayEvening") {
            fridayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            fridayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("SaturdayMorning") {
            saturdayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            saturdayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("SaturdayAfternoon") {
            saturdayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            saturdayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("SaturdayEvening") {
            saturdayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            saturdayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("SundayMorning") {
            sundayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            sundayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("SundayAfternoon") {
            sundayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            sundayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if schedulePreference.contains("SundayEvening") {
            sundayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
        } else {
            sundayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
        }
        if meetingPreference == "Local" {
            localButton.backgroundColor = .black
            localButton.setTitleColor(.white, for: .normal)
            onlineButton.backgroundColor = .lightGray
            onlineButton.setTitleColor(.black, for: .normal)
            bothButton.backgroundColor = .lightGray
            bothButton.setTitleColor(.black, for: .normal)
        }
        if meetingPreference == "Online" {
            localButton.backgroundColor = .lightGray
            localButton.setTitleColor(.black, for: .normal)
            onlineButton.backgroundColor = .black
            onlineButton.setTitleColor(.white, for: .normal)
            bothButton.backgroundColor = .lightGray
            bothButton.setTitleColor(.black, for: .normal)
        }
        if meetingPreference == "Both" {
            localButton.backgroundColor = .lightGray
            localButton.setTitleColor(.black, for: .normal)
            onlineButton.backgroundColor = .lightGray
            onlineButton.setTitleColor(.black, for: .normal)
            bothButton.backgroundColor = .black
            bothButton.setTitleColor(.white, for: .normal)
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
    
    
    @IBAction func changeSubjectsButtonTapped(_ sender: Any) {
        if self.subjectsStackView.isHidden == true {
        UIView.animate(withDuration: 0.3) {
            self.subjectsStackView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.subjectsStackView.isHidden = true
            }
            
        }
    }
    
    @IBAction func businessManagementButtonTapped(_ sender: Any) {
        if subjects.contains("Business Management") {
            businessManagementButton.backgroundColor = .lightGray
            businessManagementButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Business Management"})
            print(subjects)
        } else {
            businessManagementButton.backgroundColor = .black
            businessManagementButton.setTitleColor(.white, for: .normal)
            subjects.append("Business Management")
            print(subjects)
        }
    }
    @IBAction func accountingButtonTapped(_ sender: Any) {
        if subjects.contains("Accounting") {
            accountingButton.backgroundColor = .lightGray
            accountingButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Accounting"})
            print(subjects)
        } else {
            accountingButton.backgroundColor = .black
            accountingButton.setTitleColor(.white, for: .normal)
            subjects.append("Accounting")
            print(subjects)
        }
    }
    @IBAction func marketingButtonTapped(_ sender: Any) {
        if subjects.contains("Marketing") {
            marketingButton.backgroundColor = .lightGray
            marketingButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Marketing"})
            print(subjects)
        } else {
            marketingButton.backgroundColor = .black
            marketingButton.setTitleColor(.white, for: .normal)
            subjects.append("Marketing")
            print(subjects)
        }
    }
    @IBAction func productManagementButtonTapped(_ sender: Any) {
        if subjects.contains("Product Management") {
            productManagementButton.backgroundColor = .lightGray
            productManagementButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Product Management"})
            print(subjects)
        } else {
            productManagementButton.backgroundColor = .black
            productManagementButton.setTitleColor(.white, for: .normal)
            subjects.append("Product Management")
            print(subjects)
        }
    }
    @IBAction func entrepreneurshipButtonTapped(_ sender: Any) {
        if subjects.contains("Entrepreneurship") {
            entrepreneurshipButton.backgroundColor = .lightGray
            entrepreneurshipButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Entrepreneurship"})
            print(subjects)
        } else {
            entrepreneurshipButton.backgroundColor = .black
            entrepreneurshipButton.setTitleColor(.white, for: .normal)
            subjects.append("Entrepreneurship")
            print(subjects)
        }
    }
    @IBAction func economicsButtonTapped(_ sender: Any) {
        if subjects.contains("Economics") {
            economicsButton.backgroundColor = .lightGray
            economicsButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Economics"})
            print(subjects)
        } else {
            economicsButton.backgroundColor = .black
            economicsButton.setTitleColor(.white, for: .normal)
            subjects.append("Economics")
            print(subjects)
        }
    }
    @IBAction func webDevelopmentButtonTapped(_ sender: Any) {
        if subjects.contains("Web Development") {
            webDevelopmentButton.backgroundColor = .lightGray
            webDevelopmentButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Web Development"})
            print(subjects)
        } else {
            webDevelopmentButton.backgroundColor = .black
            webDevelopmentButton.setTitleColor(.white, for: .normal)
            subjects.append("Web Development")
            print(subjects)
        }
    }
    @IBAction func uxDesignButtonTapped(_ sender: Any) {
        if subjects.contains("UX Design") {
            uxDesignButton.backgroundColor = .lightGray
            uxDesignButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "UX Design"})
            print(subjects)
        } else {
            uxDesignButton.backgroundColor = .black
            uxDesignButton.setTitleColor(.white, for: .normal)
            subjects.append("UX Design")
            print(subjects)
        }
    }
    @IBAction func iosDevelopmentButtonTapped(_ sender: Any) {
        if subjects.contains("iOS Development") {
            iosDevelopmentButton.backgroundColor = .lightGray
            iosDevelopmentButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "iOS Development"})
            print(subjects)
        } else {
            iosDevelopmentButton.backgroundColor = .black
            iosDevelopmentButton.setTitleColor(.white, for: .normal)
            subjects.append("iOS Development")
            print(subjects)
        }
    }
    @IBAction func javascriptButtonTapped(_ sender: Any) {
        if subjects.contains("Javascript") {
            javascriptButton.backgroundColor = .lightGray
            javascriptButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Javascript"})
            print(subjects)
        } else {
            javascriptButton.backgroundColor = .black
            javascriptButton.setTitleColor(.white, for: .normal)
            subjects.append("Javascript")
            print(subjects)
        }
    }
    @IBAction func pythonButtonTapped(_ sender: Any) {
        if subjects.contains("Python") {
            pythonButton.backgroundColor = .lightGray
            pythonButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Python"})
            print(subjects)
        } else {
            pythonButton.backgroundColor = .black
            pythonButton.setTitleColor(.white, for: .normal)
            subjects.append("Python")
            print(subjects)
        }
    }
    @IBAction func softwareEngineerButtonTapped(_ sender: Any) {
        if subjects.contains("Software Development") {
            softwareEngineerButton.backgroundColor = .lightGray
            softwareEngineerButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Software Development"})
            print(subjects)
        } else {
            softwareEngineerButton.backgroundColor = .black
            softwareEngineerButton.setTitleColor(.white, for: .normal)
            subjects.append("Software Development")
            print(subjects)
        }
    }
    
    @IBAction func changePreferencesButtonTapped(_ sender: Any) {
        if self.preferencesStackView.isHidden == true {
            UIView.animate(withDuration: 0.3) {
                self.preferencesStackView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.preferencesStackView.isHidden = true
            }
            
        }
    }

    @IBAction func mondayMorningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("MondayMorning") {
            mondayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "MondayMorning"})
        } else {
            mondayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("MondayMorning")
        }
        print(schedulePreference)
    }
    @IBAction func mondayAfternoonButtonTapped(_ sender: Any) {
        if schedulePreference.contains("MondayAfternoon") {
            mondayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "MondayAfternoon"})
        } else {
            mondayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("MondayAfternoon")
        }
        print(schedulePreference)
    }
    @IBAction func mondayEveningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("MondayEvening") {
            mondayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "MondayEvening"})
        } else {
            mondayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("MondayEvening")
        }
        print(schedulePreference)
    }
    @IBAction func tuesdayMorningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("TuesdayMorning") {
            tuesdayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "TuesdayMorning"})
        } else {
            tuesdayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("TuesdayMorning")
        }
        print(schedulePreference)
    }
    @IBAction func tuesdayAfternoonButtonTapped(_ sender: Any) {
        if schedulePreference.contains("TuesdayAfternoon") {
            tuesdayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "TuesdayAfternoon"})
        } else {
            tuesdayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("TuesdayAfternoon")
        }
        print(schedulePreference)
    }
    @IBAction func tuesdayEveningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("TuesdayEvening") {
            tuesdayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "TuesdayEvening"})
        } else {
            tuesdayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("TuesdayEvening")
        }
        print(schedulePreference)
    }
    @IBAction func wednesdayMorningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("WednesdayMorning") {
            wednesdayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "WednesdayMorning"})
        } else {
            wednesdayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("WednesdayMorning")
        }
        print(schedulePreference)
    }
    @IBAction func wednesdayAfternoonButtonTapped(_ sender: Any) {
        if schedulePreference.contains("WednesdayAfternoon") {
            wednesdayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "WednesdayAfternoon"})
        } else {
            wednesdayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("WednesdayAfternoon")
        }
        print(schedulePreference)
    }
    @IBAction func wednesdayEveningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("WednesdayEvening") {
            wednesdayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "WednesdayEvening"})
        } else {
            wednesdayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("WednesdayEvening")
        }
        print(schedulePreference)
    }
    @IBAction func thursdayMorningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("ThursdayMorning") {
            thursdayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "ThursdayMorning"})
        } else {
            thursdayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("ThursdayMorning")
        }
        print(schedulePreference)
    }
    @IBAction func thursdayAfternoonButtonTapped(_ sender: Any) {
        if schedulePreference.contains("ThursdayAfternoon") {
            thursdayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "ThursdayAfternoon"})
        } else {
            thursdayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("ThursdayAfternoon")
        }
        print(schedulePreference)
    }
    @IBAction func thursdayEveningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("ThursdayEvening") {
            thursdayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "ThursdayEvening"})
        } else {
            thursdayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("ThursdayEvening")
        }
        print(schedulePreference)
    }
    @IBAction func fridayMorningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("FridayMorning") {
            fridayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "FridayMorning"})
        } else {
            fridayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("FridayMorning")
        }
        print(schedulePreference)
    }
    @IBAction func fridayAfternoonButtonTapped(_ sender: Any) {
        if schedulePreference.contains("FridayAfternoon") {
            fridayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "FridayAfternoon"})
        } else {
            fridayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("FridayAfternoon")
        }
        print(schedulePreference)
    }
    @IBAction func fridayEveningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("FridayEvening") {
            fridayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "FridayEvening"})
        } else {
            fridayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("FridayEvening")
        }
        print(schedulePreference)
    }
    @IBAction func saturdayMorningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("SaturdayMorning") {
            saturdayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "SaturdayMorning"})
        } else {
            saturdayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("SaturdayMorning")
        }
        print(schedulePreference)
    }
    @IBAction func saturdayAfternoonButtonTapped(_ sender: Any) {
        if schedulePreference.contains("SaturdayAfternoon") {
            saturdayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "SaturdayAfternoon"})
        } else {
            saturdayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("SaturdayAfternoon")
        }
        print(schedulePreference)
    }
    @IBAction func saturdayEveningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("SaturdayEvening") {
            saturdayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "SaturdayEvening"})
        } else {
            saturdayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("SaturdayEvening")
        }
        print(schedulePreference)
    }
    @IBAction func sundayMorningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("SundayMorning") {
            sundayMorningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "SundayMorning"})
        } else {
            sundayMorningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("SundayMorning")
        }
        print(schedulePreference)
    }
    @IBAction func sundayAfternoonButtonTapped(_ sender: Any) {
        if schedulePreference.contains("SundayAfternoon") {
            sundayAfternoonButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "SundayAfternoon"})
        } else {
            sundayAfternoonButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("SundayAfternoon")
        }
        print(schedulePreference)
    }
    @IBAction func sundayEveningButtonTapped(_ sender: Any) {
        if schedulePreference.contains("SundayEvening") {
            sundayEveningButton.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
            schedulePreference.removeAll(where: { $0 == "SundayEvening"})
        } else {
            sundayEveningButton.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
            schedulePreference.append("SundayEvening")
        }
        print(schedulePreference)
    }
    
    @IBAction func localButtonTapped(_ sender: Any) {
        turnOnPreference(button: localButton)
        turnOffPreference(button: onlineButton)
        turnOffPreference(button: bothButton)
        self.meetingPreference = "Local"
        print(meetingPreference)
    }
    @IBAction func onlineButtonTapped(_ sender: Any) {
        turnOnPreference(button: onlineButton)
        turnOffPreference(button: localButton)
        turnOffPreference(button: bothButton)
        self.meetingPreference = "Online"
        print(meetingPreference)
    }
    @IBAction func bothButtonTapped(_ sender: Any) {
        turnOnPreference(button: bothButton)
        turnOffPreference(button: localButton)
        turnOffPreference(button: onlineButton)
        self.meetingPreference = "Both"
        print(meetingPreference)
    }
    
    func turnOnPreference(button: UIButton) {
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
    }
    func turnOffPreference(button: UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
    }
    
    @IBAction func changeBiographyButtonTapped(_ sender: Any) {
        if self.biographyStackView.isHidden == true {
            UIView.animate(withDuration: 0.3) {
                self.biographyStackView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.biographyStackView.isHidden = true
            }
            
        }
    }
    
    @IBAction func saveChangesButtonTapped(_ sender: Any) {
        guard let user = TeacherController.shared.currentUser, let priceChange = priceTextfield.text, !priceChange.isEmpty, let newAboutMe = aboutYouTextView.text, !newAboutMe.isEmpty, let qualifications = qualificationsTextView.text, !qualifications.isEmpty else { return }
        TeacherController.shared.updateTeacher(teacherDocRef: user.selfDocRef, subjects: subjects, costPerHour: priceChange, schedulePreference: schedulePreference, meetingPreference: meetingPreference, aboutMe: newAboutMe, qualifications: qualifications) { (success) in
            if success {
                UIView.animate(withDuration: 0.3) {
                    self.biographyStackView.isHidden = true
                    self.preferencesStackView.isHidden = true
                    self.subjectsStackView.isHidden = true
                    let origin = CGPoint(x: 0, y: 0)
                    self.teacherProfileScrollView.setContentOffset(origin, animated: true)
                }
            }
        }
    }
}
