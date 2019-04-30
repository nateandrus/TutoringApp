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
    @IBOutlet weak var changePasswordButton: UIButton!
    
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
    
    var local: Bool = false
    var online: Bool = false
    var both: Bool = false
    
    var meetingPreference: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subjectsStackView.isHidden = true
        preferencesStackView.isHidden = true
        biographyStackView.isHidden = true
        
        localButton.backgroundColor = .lightGray
        onlineButton.backgroundColor = .lightGray
        bothButton.backgroundColor = .lightGray
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
    }
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
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
    }
    @IBAction func accountingButtonTapped(_ sender: Any) {
    }
    @IBAction func marketingButtonTapped(_ sender: Any) {
    }
    @IBAction func productManagementButtonTapped(_ sender: Any) {
    }
    @IBAction func entrepreneurshipButtonTapped(_ sender: Any) {
    }
    @IBAction func economicsButtonTapped(_ sender: Any) {
    }
    @IBAction func webDevelopmentButtonTapped(_ sender: Any) {
    }
    @IBAction func uxDesignButtonTapped(_ sender: Any) {
    }
    @IBAction func iosDevelopmentButtonTapped(_ sender: Any) {
    }
    @IBAction func javascriptButtonTapped(_ sender: Any) {
    }
    @IBAction func pythonButtonTapped(_ sender: Any) {
    }
    @IBAction func softwareEngineerButtonTapped(_ sender: Any) {
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
    
    func buttonSelected(button: UIButton) {
        button.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
    }
    
    func buttonDESelected(button: UIButton) {
        button.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
    }
    
    @IBAction func mondayMorningButtonTapped(_ sender: Any) {
        if mondayMorning == false {
            buttonSelected(button: mondayMorningButton)
            mondayMorning = true
        } else {
            buttonDESelected(button: mondayMorningButton)
            mondayMorning = false
        }
    }
    
    @IBAction func mondayAfternoonButtonTapped(_ sender: Any) {
        if mondayAfternoon == false {
            buttonSelected(button: mondayAfternoonButton)
            mondayAfternoon = true
        } else {
            buttonDESelected(button: mondayAfternoonButton)
            mondayAfternoon = false
        }
    }
    
    @IBAction func mondayEveningButtonTapped(_ sender: Any) {
        if mondayEvening == false {
            buttonSelected(button: mondayEveningButton)
            mondayEvening = true
        } else {
            buttonDESelected(button: mondayEveningButton)
            mondayEvening = false
        }
    }
    
    @IBAction func tuesdayMorningButtonTapped(_ sender: Any) {
        if tuesdayMorning == false {
            buttonSelected(button: tuesdayMorningButton)
            tuesdayMorning = true
        } else {
            buttonDESelected(button: tuesdayMorningButton)
            tuesdayMorning = false
        }
    }
    
    @IBAction func tuesdayAfternoonButtonTapped(_ sender: Any) {
        if tuesdayAfternoon == false {
            buttonSelected(button: tuesdayAfternoonButton)
            tuesdayAfternoon = true
        } else {
            buttonDESelected(button: tuesdayAfternoonButton)
            tuesdayAfternoon = false
        }
    }
    
    @IBAction func tuesdayEveningButtonTapped(_ sender: Any) {
        if tuesdayEvening == false {
            buttonSelected(button: tuesdayEveningButton)
            tuesdayEvening = true
        } else {
            buttonDESelected(button: tuesdayEveningButton)
            tuesdayEvening = false
        }
    }
    
    @IBAction func wednesdayMorningButtonTapped(_ sender: Any) {
        if wednesdayMorning == false {
            buttonSelected(button: wednesdayMorningButton)
            wednesdayMorning = true
        } else {
            buttonDESelected(button: wednesdayMorningButton)
            wednesdayMorning = false
        }
    }
    
    @IBAction func wednesdayAfternoonButtonTapped(_ sender: Any) {
        if wednesdayAfternoon == false {
            buttonSelected(button: wednesdayAfternoonButton)
            wednesdayAfternoon = true
        } else {
            buttonDESelected(button: wednesdayAfternoonButton)
            wednesdayAfternoon = false
        }
    }
    
    @IBAction func wednesdayEveningButtonTapped(_ sender: Any) {
        if wednesdayEvening == false {
            buttonSelected(button: wednesdayEveningButton)
            wednesdayEvening = true
        } else {
            buttonDESelected(button: wednesdayEveningButton)
            wednesdayEvening = false
        }
    }
    
    @IBAction func thursdayMorningButtonTapped(_ sender: Any) {
        if thursdayMorning == false {
            buttonSelected(button: thursdayMorningButton)
            thursdayMorning = true
        } else {
            buttonDESelected(button: thursdayMorningButton)
            thursdayMorning = false
        }
    }
    
    @IBAction func thursdayAfternoonButtonTapped(_ sender: Any) {
        if thursdayAfternoon == false {
            buttonSelected(button: thursdayAfternoonButton)
            thursdayAfternoon = true
        } else {
            buttonDESelected(button: thursdayAfternoonButton)
            thursdayAfternoon = false
        }
    }
    
    @IBAction func thursdayEveningButtonTapped(_ sender: Any) {
        if thursdayEvening == false {
            buttonSelected(button: thursdayEveningButton)
            thursdayEvening = true
        } else {
            buttonDESelected(button: thursdayEveningButton)
            thursdayEvening = false
        }
    }
    
    @IBAction func fridayMorningButtonTapped(_ sender: Any) {
        if fridayMorning == false {
            buttonSelected(button: fridayMorningButton)
            fridayMorning = true
        } else {
            buttonDESelected(button: fridayMorningButton)
            fridayMorning = false
        }
    }
    
    @IBAction func fridayAfternoonButtonTapped(_ sender: Any) {
        if fridayAfternoon == false {
            buttonSelected(button: fridayAfternoonButton)
            fridayAfternoon = true
        } else {
            buttonDESelected(button: fridayAfternoonButton)
            fridayAfternoon = false
        }
    }
    
    @IBAction func fridayEveningButtonTapped(_ sender: Any) {
        if fridayEvening == false {
            buttonSelected(button: fridayEveningButton)
            fridayEvening = true
        } else {
            buttonDESelected(button: fridayEveningButton)
            fridayEvening = false
        }
    }
    
    @IBAction func saturdayMorningButtonTapped(_ sender: Any) {
        if saturdayMorning == false {
            buttonSelected(button: saturdayMorningButton)
            saturdayMorning = true
        } else {
            buttonDESelected(button: saturdayMorningButton)
            saturdayMorning = false
        }
    }
    
    @IBAction func saturdayAfternoonButtonTapped(_ sender: Any) {
        if saturdayAfternoon == false {
            buttonSelected(button: saturdayAfternoonButton)
            saturdayAfternoon = true
        } else {
            buttonDESelected(button: saturdayAfternoonButton)
            saturdayAfternoon = false
        }
    }
    
    @IBAction func saturdayEveningButtonTapped(_ sender: Any) {
        if saturdayEvening == false {
            buttonSelected(button: saturdayEveningButton)
            saturdayEvening = true
        } else {
            buttonDESelected(button: saturdayEveningButton)
            saturdayEvening = false
        }
    }
    
    @IBAction func sundayMorningButtonTapped(_ sender: Any) {
        if sundayMorning == false {
            buttonSelected(button: sundayMorningButton)
            sundayMorning = true
        } else {
            buttonDESelected(button: sundayMorningButton)
            sundayMorning = false
        }
    }
    
    @IBAction func sundayAfternoonButtonTapped(_ sender: Any) {
        if sundayAfternoon == false {
            buttonSelected(button: sundayAfternoonButton)
            sundayAfternoon = true
        } else {
            buttonDESelected(button: sundayAfternoonButton)
            sundayAfternoon = false
        }
    }
    
    @IBAction func sundayEveningButtonTapped(_ sender: Any) {
        if sundayEvening == false {
            buttonSelected(button: sundayEveningButton)
            sundayEvening = true
        } else {
            buttonDESelected(button: sundayEveningButton)
            sundayEvening = false
        }
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    
}
