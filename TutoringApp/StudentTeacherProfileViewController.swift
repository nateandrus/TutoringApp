//
//  StudentTeacherProfileViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SafariServices

class StudentTeacherProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var linkedInButton: UIButton!
    @IBOutlet weak var aboutMeLabel: UILabel!
    @IBOutlet weak var qualificationsLabel: UILabel!
    @IBOutlet weak var mondayAvailabilityLabel: UILabel!
    @IBOutlet weak var tuesdayAvailabilityLabel: UILabel!
    @IBOutlet weak var wednesdayAvailabilityLabel: UILabel!
    @IBOutlet weak var thursdayAvailabilityLabel: UILabel!
    @IBOutlet weak var fridayAvailabilityLabel: UILabel!
    @IBOutlet weak var saturdayAvailabilityLabel: UILabel!
    @IBOutlet weak var sundayAvailabilityLabel: UILabel!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    var teacher: Teacher?
    
    var schedulePreference: [String] = []
    
    var morning = "Morning"
    var afternoon = "Afternoon"
    var evening = "Evening"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        guard let selectedTeacher = teacher else { return }
        nameLabel.text = selectedTeacher.name
        locationLabel.text = selectedTeacher.location
        priceLabel.text = "$\(selectedTeacher.costForTime)/hour"
        linkedInButton.setTitle(selectedTeacher.name + "'s LinkedIn", for: .normal)
        aboutMeLabel.text = selectedTeacher.aboutMe
        qualificationsLabel.text = selectedTeacher.qualifications
        schedulePreference = selectedTeacher.schedulePref
        //self.title = selectedTeacher.name
        sendMessageButton.layer.cornerRadius = sendMessageButton.frame.height / 2
        TeacherController.shared.loadProfileImageView(userFirebaseUID: selectedTeacher.firebaseUID) { (image) in
            if let image = image {
                self.profileImage.image = image
            } else {
                self.profileImage.image = #imageLiteral(resourceName: "default user icon")
            }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMessageController" {
            guard let teacher = teacher else { return }
            if let destinationVC = segue.destination as? StudentHomeTabMessagingViewController {
                destinationVC.teacherLanding = teacher
                destinationVC.delegate = self
            }
        }
    }
    
    func showSafariVC(for url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
        
    }
    
    @IBAction func linkedInButtonTapped(_ sender: Any) {
        guard let selectedTeacher = teacher else { return }
        showSafariVC(for: selectedTeacher.linkedINLink!)
    }
}

extension StudentTeacherProfileViewController: StudentHomeTabMessagingViewControllerDelegate {
    
    func messageSent() {
        DispatchQueue.main.async { [weak self] in
            self?.tabBarController?.selectedIndex = 1
        }
    }
}
