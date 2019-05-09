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
    
    
    
    
    
    var subjects: [String] = []
    var schedulePreference: [String] = []
    var meetingPreference: String = ""
    
    var morning = "Morning"
    var afternoon = "Afternoon"
    var evening = "Evening"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        TeacherController.shared.loadProfileImageView(userFirebaseUID: user.firebaseUID) { (image) in
            guard let image = image else { return }
            self.profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
            self.profileImage.image = image
        }
        
        
        self.navigationItem.title = "Profile"
        nameLabel.text = user.name
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
                
                TeacherController.shared.loadProfileImageView(userFirebaseUID: user.firebaseUID) { (image) in
                    guard let image = image else { return }
                    self.profileImage.layer.cornerRadius = self.profileImage.frame.height / 2
                    self.profileImage.image = image
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
                if self.schedulePreference.contains("MondayMorning") == false && self.schedulePreference.contains("MondayAfternoon") == false && self.schedulePreference.contains("MondayEvening") == false {
                    self.mondayAvailabilityLabel.text = "Not Available"
                }
                if self.schedulePreference.contains("TuesdayMorning") == false && self.schedulePreference.contains("TuesdayAfternoon") == false && self.schedulePreference.contains("TuesdayEvening") == false {
                    self.tuesdayAvailabilityLabel.text = "Not Available"
                }
                if self.schedulePreference.contains("WednesdayMorning") == false && self.schedulePreference.contains("WednesdayAfternoon") == false && self.schedulePreference.contains("WednesdayEvening") == false {
                    self.wednesdayAvailabilityLabel.text = "Not Available"
                }
                if self.schedulePreference.contains("ThursdayMorning") == false && self.schedulePreference.contains("ThursdayAfternoon") == false && self.schedulePreference.contains("ThursdayEvening") == false {
                    self.thursdayAvailabilityLabel.text = "Not Available"
                }
                if self.schedulePreference.contains("FridayMorning") == false && self.schedulePreference.contains("FridayAfternoon") == false && self.schedulePreference.contains("FridayEvening") == false {
                    self.fridayAvailabilityLabel.text = "Not Available"
                }
                if self.schedulePreference.contains("SaturdayMorning") == false && self.schedulePreference.contains("SaturdayAfternoon") == false && self.schedulePreference.contains("SaturdayEvening") == false {
                    self.saturdayAvailabilityLabel.text = "Not Available"
                }
                if self.schedulePreference.contains("SundayMorning") == false && self.schedulePreference.contains("SundayAfternoon") == false && self.schedulePreference.contains("SundayEvening") == false {
                    self.sundayAvailabilityLabel.text = "Not Available"
                }
                
            }
        }
    }
   
}

