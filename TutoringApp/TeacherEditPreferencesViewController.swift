//
//  TeacherEditPreferencesViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 5/3/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class TeacherEditPreferencesViewController: UIViewController {

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
    @IBOutlet weak var inPersonButton: UIButton!
    @IBOutlet weak var onlineButton: UIButton!
    @IBOutlet weak var bothButton: UIButton!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    var schedulePreference: [String] = []
    var meetingPreference: String = ""
    
    static let shared = TeacherEditPreferencesViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = TeacherController.shared.currentUser
            else { return }
        priceTextfield.text = user.costForTime
        meetingPreference = user.meetingPref
        schedulePreference = user.schedulePref
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
        if meetingPreference == "In Person" {
            inPersonButton.backgroundColor = .black
            inPersonButton.setTitleColor(.white, for: .normal)
            onlineButton.backgroundColor = .lightGray
            onlineButton.setTitleColor(.black, for: .normal)
            bothButton.backgroundColor = .lightGray
            bothButton.setTitleColor(.black, for: .normal)
        }
        if meetingPreference == "Online" {
            inPersonButton.backgroundColor = .lightGray
            inPersonButton.setTitleColor(.black, for: .normal)
            onlineButton.backgroundColor = .black
            onlineButton.setTitleColor(.white, for: .normal)
            bothButton.backgroundColor = .lightGray
            bothButton.setTitleColor(.black, for: .normal)
        }
        if meetingPreference == "Both" {
            inPersonButton.backgroundColor = .lightGray
            inPersonButton.setTitleColor(.black, for: .normal)
            onlineButton.backgroundColor = .lightGray
            onlineButton.setTitleColor(.black, for: .normal)
            bothButton.backgroundColor = .black
            bothButton.setTitleColor(.white, for: .normal)
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
    
    @IBAction func inPersonButtonTapped(_ sender: Any) {
        turnOnPreference(button: inPersonButton)
        turnOffPreference(button: onlineButton)
        turnOffPreference(button: bothButton)
        self.meetingPreference = "In Person"
        print(meetingPreference)
    }
    @IBAction func onlineButtonTapped(_ sender: Any) {
        turnOnPreference(button: onlineButton)
        turnOffPreference(button: inPersonButton)
        turnOffPreference(button: bothButton)
        self.meetingPreference = "Online"
        print(meetingPreference)
    }
    @IBAction func bothButtonTapped(_ sender: Any) {
        turnOnPreference(button: bothButton)
        turnOffPreference(button: inPersonButton)
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

    @IBAction func saveChangesButtonTapped(_ sender: Any) {
        guard let user = TeacherController.shared.currentUser, let priceChange = priceTextfield.text, !priceChange.isEmpty else { return }
        TeacherController.shared.updateTeacherPreferences(teacherDocRef: user.selfDocRef, costPerHour: priceChange, schedulePreference: schedulePreference, meetingPreference: meetingPreference) { (success) in
            if success {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
