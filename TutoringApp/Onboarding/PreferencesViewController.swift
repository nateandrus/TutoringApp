//
//  PreferencesViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var hourlyRateTextField: UITextField!
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
    @IBOutlet weak var nextStepButton: UIButton!
    
    var schedulePreferences: [String] = []
    var meetingPreference: String = ""
    
    //LandingPads
    var nameLandingPad: String?
    var email: String?
    var profileImage: UIImage?
    var location: String?
    var dateOfBirth: String?
    var subjectsLanding: [String]?
    var userFirebaseUID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localButton.layer.cornerRadius = 5
        localButton.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        localButton.layer.borderWidth = 2
        onlineButton.layer.cornerRadius = 5
        onlineButton.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        onlineButton.layer.borderWidth = 2
        bothButton.layer.cornerRadius = 5
        bothButton.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        bothButton.layer.borderWidth = 2
        nextStepButton.layer.cornerRadius = 5
        
    }
    
    //Scheduling Booleans
    var mondayMorning: Bool = false
    var mondayAfternoon: Bool = false
    var mondayEvening: Bool = false
    var tuesdayMorning: Bool = false
    var tuesdayAfternoon: Bool = false
    var tuesdayEvening: Bool = false
    var wednesdayMorning: Bool = false
    var wednesdayAfternoon: Bool = false
    var wednesdayEvening: Bool = false
    var thursdayMorning: Bool = false
    var thursdayAfternoon: Bool = false
    var thursdayEvening: Bool = false
    var fridayMorning: Bool = false
    var fridayAfternoon: Bool = false
    var fridayEvening: Bool = false
    var saturdayMorning: Bool = false
    var saturdayAfternoon: Bool = false
    var saturdayEvening: Bool = false
    var sundayMorning: Bool = false
    var sundayAfternoon: Bool = false
    var sundayEvening: Bool = false
    //Online/Offline Booleans
    var local: Bool = false
    var online: Bool = false
    var both: Bool = false
    
    //MARK: - Actions
    @IBAction func mondayMorningButtonTapped(_ sender: UIButton) {
        if mondayMorning == false {
            buttonSelected(button: mondayMorningButton)
            self.schedulePreferences.append("MondayMorning")
            print(schedulePreferences)
            mondayMorning = true
        } else {
            buttonDESelected(button: mondayMorningButton)
            mondayMorning = false
            self.schedulePreferences.removeAll(where: {$0 == "MondayMorning"})
            print(schedulePreferences)
        }
    }
    @IBAction func mondayAfternoon(_ sender: UIButton) {
        if mondayAfternoon == false {
            buttonSelected(button: mondayAfternoonButton)
            self.schedulePreferences.append("MondayAfternoon")
            print(schedulePreferences)
            mondayAfternoon = true
        } else {
            buttonDESelected(button: mondayAfternoonButton)
            mondayAfternoon = false
            self.schedulePreferences.removeAll(where: {$0 == "MondayAfternoon"})
            print(schedulePreferences)
        }
    }
    @IBAction func mondayEvening(_ sender: UIButton) {
        if mondayEvening == false {
            buttonSelected(button: mondayEveningButton)
            self.schedulePreferences.append("MondayEvening")
            print(schedulePreferences)
            mondayEvening = true
        } else {
            buttonDESelected(button: mondayEveningButton)
            mondayEvening = false
            self.schedulePreferences.removeAll(where: {$0 == "MondayEvening"})
            print(schedulePreferences)
        }
    }
    @IBAction func tuesdayMorning(_ sender: UIButton) {
        if tuesdayMorning == false {
            buttonSelected(button: tuesdayMorningButton)
            self.schedulePreferences.append("TuesdayMorning")
            print(schedulePreferences)
            tuesdayMorning = true
        } else {
            buttonDESelected(button: tuesdayMorningButton)
            tuesdayMorning = false
            self.schedulePreferences.removeAll(where: {$0 == "TuesdayMorning"})
            print(schedulePreferences)
        }
    }
    @IBAction func tuesdayAfternoon(_ sender: UIButton) {
        if tuesdayAfternoon == false {
            buttonSelected(button: tuesdayAfternoonButton)
            self.schedulePreferences.append("TuesdayAfternoon")
            print(schedulePreferences)
            tuesdayAfternoon = true
        } else {
            buttonDESelected(button: tuesdayAfternoonButton)
            tuesdayAfternoon = false
            self.schedulePreferences.removeAll(where: {$0 == "TuesdayAfternoon"})
            print(schedulePreferences)
        }
    }
    @IBAction func tuesdayEvening(_ sender: UIButton) {
        if tuesdayEvening == false {
            buttonSelected(button: tuesdayEveningButton)
            self.schedulePreferences.append("TuesdayEvening")
            print(schedulePreferences)
            tuesdayEvening = true
        } else {
            buttonDESelected(button: tuesdayEveningButton)
            tuesdayEvening = false
            self.schedulePreferences.removeAll(where: {$0 == "TuesdayEvening"})
            print(schedulePreferences)
        }
    }
    @IBAction func wednesdayMorning(_ sender: UIButton) {
        if wednesdayMorning == false {
            buttonSelected(button: wednesdayMorningButton)
            self.schedulePreferences.append("WednesdayMorning")
            print(schedulePreferences)
            wednesdayMorning = true
        } else {
            buttonDESelected(button: wednesdayMorningButton)
            wednesdayMorning = false
            self.schedulePreferences.removeAll(where: {$0 == "WednesdayMorning"})
            print(schedulePreferences)
        }
    }
    @IBAction func wednesdayAfternoon(_ sender: UIButton) {
        if wednesdayAfternoon == false {
            buttonSelected(button: wednesdayAfternoonButton)
            self.schedulePreferences.append("WednesdayAfternoon")
            print(schedulePreferences)
            wednesdayAfternoon = true
        } else {
            buttonDESelected(button: wednesdayAfternoonButton)
            wednesdayAfternoon = false
            self.schedulePreferences.removeAll(where: {$0 == "WednesdayAfternoon"})
            print(schedulePreferences)
        }
    }
    @IBAction func wednesdayEvening(_ sender: UIButton) {
        if wednesdayEvening == false {
            buttonSelected(button: wednesdayEveningButton)
            self.schedulePreferences.append("WednesdayEvening")
            print(schedulePreferences)
            wednesdayEvening = true
        } else {
            buttonDESelected(button: wednesdayEveningButton)
            wednesdayEvening = false
            self.schedulePreferences.removeAll(where: {$0 == "WednesdayEvening"})
            print(schedulePreferences)
        }
    }
    @IBAction func thursdayMorning(_ sender: UIButton) {
        if thursdayMorning == false {
            buttonSelected(button: thursdayMorningButton)
            self.schedulePreferences.append("ThursdayMorning")
            print(schedulePreferences)
            thursdayMorning = true
        } else {
            buttonDESelected(button: thursdayMorningButton)
            thursdayMorning = false
            self.schedulePreferences.removeAll(where: {$0 == "ThursdayMorning"})
            print(schedulePreferences)
        }
    }
    @IBAction func thursdayAfternoon(_ sender: UIButton) {
        if thursdayAfternoon == false {
            buttonSelected(button: thursdayAfternoonButton)
            self.schedulePreferences.append("ThursdayAfternoon")
            print(schedulePreferences)
            thursdayAfternoon = true
        } else {
            buttonDESelected(button: thursdayAfternoonButton)
            thursdayAfternoon = false
            self.schedulePreferences.removeAll(where: {$0 == "ThursdayAfternoon"})
            print(schedulePreferences)
        }
    }
    @IBAction func thursdayEvening(_ sender: UIButton) {
        if thursdayEvening == false {
            buttonSelected(button: thursdayEveningButton)
            self.schedulePreferences.append("ThursdayEvening")
            print(schedulePreferences)
            thursdayEvening = true
        } else {
            buttonDESelected(button: thursdayEveningButton)
            thursdayEvening = false
            self.schedulePreferences.removeAll(where: {$0 == "ThursdayEvening"})
            print(schedulePreferences)
        }
    }
    @IBAction func fridayMorning(_ sender: UIButton) {
        if fridayMorning == false {
            buttonSelected(button: fridayMorningButton)
            self.schedulePreferences.append("FridayMorning")
            print(schedulePreferences)
            fridayMorning = true
        } else {
            buttonDESelected(button: fridayMorningButton)
            fridayMorning = false
            self.schedulePreferences.removeAll(where: {$0 == "FridayMorning"})
            print(schedulePreferences)
        }
    }
    @IBAction func fridayAfternoon(_ sender: UIButton) {
        if fridayAfternoon == false {
            buttonSelected(button: fridayAfternoonButton)
            self.schedulePreferences.append("FridayAfternoon")
            print(schedulePreferences)
            fridayAfternoon = true
        } else {
            buttonDESelected(button: fridayAfternoonButton)
            fridayAfternoon = false
            self.schedulePreferences.removeAll(where: {$0 == "FridayAfternoon"})
            print(schedulePreferences)
        }
    }
    @IBAction func fridayEvening(_ sender: UIButton) {
        if fridayEvening == false {
            buttonSelected(button: fridayEveningButton)
            self.schedulePreferences.append("FridayEvening")
            print(schedulePreferences)
            fridayEvening = true
        } else {
            buttonDESelected(button: fridayEveningButton)
            fridayEvening = false
            self.schedulePreferences.removeAll(where: {$0 == "FridayEvening"})
            print(schedulePreferences)
        }
    }
    @IBAction func saturdayMorning(_ sender: UIButton) {
        if saturdayMorning == false {
            buttonSelected(button: saturdayMorningButton)
            self.schedulePreferences.append("SaturdayMorning")
            print(schedulePreferences)
            saturdayMorning = true
        } else {
            buttonDESelected(button: saturdayMorningButton)
            saturdayMorning = false
            self.schedulePreferences.removeAll(where: {$0 == "SaturdayMorning"})
            print(schedulePreferences)
        }
    }
    @IBAction func saturdayAfternoon(_ sender: UIButton) {
        if saturdayAfternoon == false {
            buttonSelected(button: saturdayAfternoonButton)
            self.schedulePreferences.append("SaturdayAfternoon")
            print(schedulePreferences)
            saturdayAfternoon = true
        } else {
            buttonDESelected(button: saturdayAfternoonButton)
            saturdayAfternoon = false
            self.schedulePreferences.removeAll(where: {$0 == "SaturdayAfternoon"})
            print(schedulePreferences)
        }
    }
    @IBAction func saturdayEvening(_ sender: UIButton) {
        if saturdayEvening == false {
            buttonSelected(button: saturdayEveningButton)
            self.schedulePreferences.append("SaturdayEvening")
            print(schedulePreferences)
            saturdayEvening = true
        } else {
            buttonDESelected(button: saturdayEveningButton)
            saturdayEvening = false
            self.schedulePreferences.removeAll(where: {$0 == "SaturdayEvening"})
            print(schedulePreferences)
        }
    }
    @IBAction func sundayMorning(_ sender: UIButton) {
        if sundayMorning == false {
            buttonSelected(button: sundayMorningButton)
            self.schedulePreferences.append("SundayMorning")
            print(schedulePreferences)
            sundayMorning = true
        } else {
            buttonDESelected(button: sundayMorningButton)
            sundayMorning = false
            self.schedulePreferences.removeAll(where: {$0 == "SundayMorning"})
            print(schedulePreferences)
        }
    }
    @IBAction func sundayAfternoon(_ sender: UIButton) {
        if sundayAfternoon == false {
            buttonSelected(button: sundayAfternoonButton)
            self.schedulePreferences.append("SundayAfternoon")
            print(schedulePreferences)
            sundayAfternoon = true
        } else {
            buttonDESelected(button: sundayAfternoonButton)
            sundayAfternoon = false
            self.schedulePreferences.removeAll(where: {$0 == "SundayAfternoon"})
            print(schedulePreferences)
        }
    }
    @IBAction func sundayEvening(_ sender: UIButton) {
        if sundayEvening == false {
            buttonSelected(button: sundayEveningButton)
            self.schedulePreferences.append("SundayEvening")
            print(schedulePreferences)
            sundayEvening = true
        } else {
            buttonDESelected(button: sundayEveningButton)
            sundayEvening = false
            self.schedulePreferences.removeAll(where: {$0 == "SundayEvening"})
            print(schedulePreferences)
        }
    }
    
    func buttonSelected(button: UIButton) {
        button.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
    }
    func buttonDESelected(button: UIButton) {
        button.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
    }
    
    @IBAction func localButtontapped(_ sender: UIButton) {
        turnOnPreference(button: localButton)
        turnOffPreference(button: onlineButton)
        turnOffPreference(button: bothButton)
        self.meetingPreference = "Local"
        print(meetingPreference)
    }
    @IBAction func onlineButtonTapped(_ sender: UIButton) {
        turnOnPreference(button: onlineButton)
        turnOffPreference(button: localButton)
        turnOffPreference(button: bothButton)
        self.meetingPreference = "Online"
        print(meetingPreference)
    }
    @IBAction func bothButtonTapped(_ sender: UIButton) {
        turnOnPreference(button: bothButton)
        turnOffPreference(button: localButton)
        turnOffPreference(button: onlineButton)
        self.meetingPreference = "Both"
        print(meetingPreference)
    }
    
    func turnOnPreference(button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        button.setTitleColor(.white, for: .normal)
    }
    func turnOffPreference(button: UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(#colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1), for: .normal)
        button.layer.borderColor = #colorLiteral(red: 0.02745098039, green: 0.2705882353, blue: 0.4352941176, alpha: 1)
        button.layer.borderWidth = 2
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toBiography" {
            guard schedulePreferences != [], let costPerHour = Int(hourlyRateTextField.text!), meetingPreference != "" else {
                alertController()
                return false
            }
        }
        return true
    }
    func alertController() {
        let alertController = UIAlertController(title: "You shall not pass!", message: "It looks like you are missing some information needed to proceed, make sure that you have filled out all the information to continue!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toBiography" {
            guard let name = nameLandingPad, let email = email, let location = location, let dateofBirth = dateOfBirth, let subjects = subjectsLanding, let costPerHour = Int(hourlyRateTextField.text!), let userFirebaseUID = userFirebaseUID else { return }
            if let destinationVC = segue.destination as? BiographyViewController {
                destinationVC.nameLandingPad = name
                destinationVC.email = email
                destinationVC.location = location
                destinationVC.dateOfBirth = dateofBirth
                destinationVC.profileImage = profileImage
                destinationVC.subjectsLanding = subjects
                destinationVC.costPerHour = costPerHour
                destinationVC.meetingPreference = meetingPreference
                destinationVC.schedulePreference = schedulePreferences
                destinationVC.userFirebaseUID = userFirebaseUID
            }
        }
    }
}
