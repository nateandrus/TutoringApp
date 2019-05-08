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

class StudentTeacherProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var linkedInLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    @IBOutlet weak var qualificationsLabel: UILabel!
    @IBOutlet weak var mondayMorningLabel: UILabel!
    @IBOutlet weak var mondayAfternoonLabel: UILabel!
    @IBOutlet weak var mondayEveningLabel: UILabel!
    @IBOutlet weak var tuesdayMorning: UILabel!
    @IBOutlet weak var tuesdayAfternoonLabel: UILabel!
    @IBOutlet weak var tuesdayEveningLabel: UILabel!
    @IBOutlet weak var wednesdayMorningLabel: UILabel!
    @IBOutlet weak var wednesdayAfternoonLabel: UILabel!
    @IBOutlet weak var wednesdayEveningLabel: UILabel!
    @IBOutlet weak var thursdayMorningLabel: UILabel!
    @IBOutlet weak var thursdayAfternoonLabel: UILabel!
    @IBOutlet weak var thursdayEveningLabel: UILabel!
    @IBOutlet weak var fridayMorningLabel: UILabel!
    @IBOutlet weak var fridayAfternoonLabel: UILabel!
    @IBOutlet weak var fridayEveningLabel: UILabel!
    @IBOutlet weak var saturdayMorningLabel: UILabel!
    @IBOutlet weak var saturdayAfternoonLabel: UILabel!
    @IBOutlet weak var saturdayEveningLabel: UILabel!
    @IBOutlet weak var sundayMorningLabel: UILabel!
    @IBOutlet weak var sundayAfternoonLabel: UILabel!
    @IBOutlet weak var sundayEveningLabel: UILabel!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    var teacher: Teacher? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileImage.layer.cornerRadius = profileImage.frame.height / 2
        guard let selectedTeacher = teacher else { return }
        nameLabel.text = selectedTeacher.name
        locationLabel.text = selectedTeacher.location
        priceLabel.text = "$\(selectedTeacher.costForTime)/hour"
        linkedInLabel.text = selectedTeacher.linkedINLink
        aboutMeLabel.text = selectedTeacher.aboutMe
        qualificationsLabel.text = selectedTeacher.qualifications
        self.title = selectedTeacher.name
        sendMessageButton.layer.cornerRadius = sendMessageButton.frame.height / 2
        TeacherController.shared.loadProfileImageView(userFirebaseUID: selectedTeacher.firebaseUID) { (image) in
            if let image = image {
                self.profileImage.image = image
            } else {
                self.profileImage.image = #imageLiteral(resourceName: "default user icon")
            }
        }
        if selectedTeacher.schedulePref.contains("MondayMorning") {
            mondayMorningLabel.backgroundColor = .black
            mondayMorningLabel.textColor = .white
            mondayMorningLabel.layer.cornerRadius = mondayMorningLabel.frame.height / 2
        }
        if selectedTeacher.schedulePref.contains("MondayAfternoon") {
            mondayAfternoonLabel.backgroundColor = .black
            mondayAfternoonLabel.textColor = .white
            mondayAfternoonLabel.layer.cornerRadius = mondayAfternoonLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("MondayEvening") {
            mondayEveningLabel.backgroundColor = .black
            mondayEveningLabel.textColor = .white
            mondayEveningLabel.layer.cornerRadius = mondayEveningLabel.frame.height / 2
        }
        if selectedTeacher.schedulePref.contains("TuesdayMorning") {
            tuesdayMorning.backgroundColor = .black
            tuesdayMorning.textColor = .white
            tuesdayMorning.layer.cornerRadius = tuesdayMorning.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("TuesdayAfternoon") {
            tuesdayAfternoonLabel.backgroundColor = .black
            tuesdayAfternoonLabel.textColor = .white
            tuesdayAfternoonLabel.layer.cornerRadius = tuesdayAfternoonLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("TuesdayEvening") {
            tuesdayEveningLabel.backgroundColor = .black
            tuesdayEveningLabel.textColor = .white
            tuesdayEveningLabel.layer.cornerRadius = tuesdayEveningLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("WednesdayMorning") {
            wednesdayMorningLabel.backgroundColor = .black
            wednesdayMorningLabel.textColor = .white
            wednesdayMorningLabel.layer.cornerRadius = wednesdayMorningLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("WednesdayAfternoon") {
            wednesdayAfternoonLabel.backgroundColor = .black
            wednesdayAfternoonLabel.textColor = .white
            wednesdayAfternoonLabel.layer.cornerRadius = wednesdayAfternoonLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("WednesdayEvening") {
            wednesdayEveningLabel.backgroundColor = .black
            wednesdayEveningLabel.textColor = .white
            wednesdayEveningLabel.layer.cornerRadius = wednesdayEveningLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("ThursdayMorning") {
            thursdayMorningLabel.backgroundColor = .black
            thursdayMorningLabel.textColor = .white
            thursdayMorningLabel.layer.cornerRadius = thursdayMorningLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("ThursdayAfternoon") {
            thursdayAfternoonLabel.backgroundColor = .black
            thursdayAfternoonLabel.textColor = .white
            thursdayAfternoonLabel.layer.cornerRadius = thursdayAfternoonLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("ThursdayEvening") {
            thursdayEveningLabel.backgroundColor = .black
            thursdayEveningLabel.textColor = .white
            thursdayEveningLabel.layer.cornerRadius = thursdayEveningLabel.frame.height / 2
        }
        if selectedTeacher.schedulePref.contains("FridayMorning") {
            fridayMorningLabel.backgroundColor = .black
            fridayMorningLabel.textColor = .white
            fridayMorningLabel.layer.cornerRadius = fridayMorningLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("FridayAfternoon") {
            fridayAfternoonLabel.backgroundColor = .black
            fridayAfternoonLabel.textColor = .white
            fridayAfternoonLabel.layer.cornerRadius = fridayAfternoonLabel.frame.height / 2
        }
        if selectedTeacher.schedulePref.contains("FridayEvening") {
            fridayEveningLabel.backgroundColor = .black
            fridayEveningLabel.textColor = .white
            fridayEveningLabel.layer.cornerRadius = fridayEveningLabel.frame.height / 2
        }
        if selectedTeacher.schedulePref.contains("SaturdayMorning") {
            saturdayMorningLabel.backgroundColor = .black
            saturdayMorningLabel.textColor = .white
            saturdayMorningLabel.layer.cornerRadius = saturdayMorningLabel.frame.height / 2

        }
        if selectedTeacher.schedulePref.contains("SaturdayAfternoon") {
            saturdayAfternoonLabel.backgroundColor = .black
            saturdayAfternoonLabel.textColor = .white
            saturdayAfternoonLabel.layer.cornerRadius = saturdayAfternoonLabel.frame.height / 2
        }
        if selectedTeacher.schedulePref.contains("SaturdayEvening") {
            saturdayEveningLabel.backgroundColor = .black
            saturdayEveningLabel.textColor = .white
            saturdayEveningLabel.layer.cornerRadius = saturdayEveningLabel.frame.height / 2
        }
        if selectedTeacher.schedulePref.contains("SundayMorning") {
            sundayMorningLabel.backgroundColor = .black
            sundayMorningLabel.textColor = .white
            sundayMorningLabel.layer.cornerRadius = sundayMorningLabel.frame.height / 2
        }
        if selectedTeacher.schedulePref.contains("SundayAfternoon") {
            sundayAfternoonLabel.backgroundColor = .black
            sundayAfternoonLabel.textColor = .white
            sundayAfternoonLabel.layer.cornerRadius = sundayAfternoonLabel.frame.height / 2
        }
        if selectedTeacher.schedulePref.contains("SundayEvening") {
            sundayEveningLabel.backgroundColor = .black
            sundayEveningLabel.textColor = .white
            sundayEveningLabel.layer.cornerRadius = sundayEveningLabel.frame.height / 2
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
}

extension StudentTeacherProfileViewController: StudentHomeTabMessagingViewControllerDelegate {
    
    func messageSent() {
        DispatchQueue.main.async { [weak self] in
            self?.tabBarController?.selectedIndex = 1
        }
    }
}
