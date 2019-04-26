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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        localButton.layer.cornerRadius = localButton.frame.height / 2
        onlineButton.layer.cornerRadius = onlineButton.frame.height / 2
        bothButton.layer.cornerRadius = bothButton.frame.height / 2
        nextStepButton.layer.cornerRadius = nextStepButton.frame.height / 2
        localButton.backgroundColor = .lightGray
        onlineButton.backgroundColor = .lightGray
        bothButton.backgroundColor = .lightGray
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
    
    @IBAction func mondayMorningButtonTapped(_ sender: UIButton) {
        if mondayMorning == false {
            buttonSelected(button: mondayMorningButton)
            mondayMorning = true
        } else {
            buttonDESelected(button: mondayMorningButton)
            mondayMorning = false
        }
    }
    @IBAction func mondayAfternoon(_ sender: UIButton) {
        if mondayAfternoon == false {
            buttonSelected(button: mondayAfternoonButton)
            mondayAfternoon = true
        } else {
            buttonDESelected(button: mondayAfternoonButton)
            mondayAfternoon = false
        }
    }
    @IBAction func mondayEvening(_ sender: UIButton) {
        if mondayEvening == false {
            buttonSelected(button: mondayEveningButton)
            mondayEvening = true
        } else {
            buttonDESelected(button: mondayEveningButton)
            mondayEvening = false
        }
    }
    @IBAction func tuesdayMorning(_ sender: UIButton) {
        if tuesdayMorning == false {
            buttonSelected(button: tuesdayMorningButton)
            tuesdayMorning = true
        } else {
            buttonDESelected(button: tuesdayMorningButton)
            tuesdayMorning = false
        }
    }
    @IBAction func tuesdayAfternoon(_ sender: UIButton) {
        if tuesdayAfternoon == false {
            buttonSelected(button: tuesdayAfternoonButton)
            tuesdayAfternoon = true
        } else {
            buttonDESelected(button: tuesdayAfternoonButton)
            tuesdayAfternoon = false
        }
    }
    @IBAction func tuesdayEvening(_ sender: UIButton) {
        if tuesdayEvening == false {
            buttonSelected(button: tuesdayEveningButton)
            tuesdayEvening = true
        } else {
            buttonDESelected(button: tuesdayEveningButton)
            tuesdayEvening = false
        }
    }
    @IBAction func wednesdayMorning(_ sender: UIButton) {
        if wednesdayMorning == false {
            buttonSelected(button: wednesdayMorningButton)
            wednesdayMorning = true
        } else {
            buttonDESelected(button: wednesdayMorningButton)
            wednesdayMorning = false
        }
    }
    @IBAction func wednesdayAfternoon(_ sender: UIButton) {
        if wednesdayAfternoon == false {
            buttonSelected(button: wednesdayAfternoonButton)
            wednesdayAfternoon = true
        } else {
            buttonDESelected(button: wednesdayAfternoonButton)
            wednesdayAfternoon = false
        }
        
    }
    @IBAction func wednesdayEvening(_ sender: UIButton) {
        if wednesdayEvening == false {
            buttonSelected(button: wednesdayEveningButton)
            wednesdayEvening = true
        } else {
            buttonDESelected(button: wednesdayEveningButton)
            wednesdayEvening = false
        }
    }
    @IBAction func thursdayMorning(_ sender: UIButton) {
        if thursdayMorning == false {
            buttonSelected(button: thursdayMorningButton)
            thursdayMorning = true
        } else {
            buttonDESelected(button: thursdayMorningButton)
            thursdayMorning = false
        }
    }
    @IBAction func thursdayAfternoon(_ sender: UIButton) {
        if thursdayAfternoon == false {
            buttonSelected(button: thursdayAfternoonButton)
            thursdayAfternoon = true
        } else {
            buttonDESelected(button: thursdayAfternoonButton)
            thursdayAfternoon = false
        }
    }
    @IBAction func thursdayEvening(_ sender: UIButton) {
        if thursdayEvening == false {
            buttonSelected(button: thursdayEveningButton)
            thursdayEvening = true
        } else {
            buttonDESelected(button: thursdayEveningButton)
            thursdayEvening = false
        }
    }
    @IBAction func fridayMorning(_ sender: UIButton) {
        if fridayMorning == false {
            buttonSelected(button: fridayMorningButton)
            fridayMorning = true
        } else {
            buttonDESelected(button: fridayMorningButton)
            fridayMorning = false
        }
    }
    @IBAction func fridayAfternoon(_ sender: UIButton) {
        if fridayAfternoon == false {
            buttonSelected(button: fridayAfternoonButton)
            fridayAfternoon = true
        } else {
            buttonDESelected(button: fridayAfternoonButton)
            fridayAfternoon = false
        }
    }
    @IBAction func fridayEvening(_ sender: UIButton) {
        if fridayEvening == false {
            buttonSelected(button: fridayEveningButton)
            fridayEvening = true
        } else {
            buttonDESelected(button: fridayEveningButton)
            fridayEvening = false
        }
    }
    @IBAction func saturdayMorning(_ sender: UIButton) {
        if saturdayMorning == false {
            buttonSelected(button: saturdayMorningButton)
            saturdayMorning = true
        } else {
            buttonDESelected(button: saturdayMorningButton)
            saturdayMorning = false
        }
    }
    @IBAction func saturdayAfternoon(_ sender: UIButton) {
        if saturdayAfternoon == false {
            buttonSelected(button: saturdayAfternoonButton)
            saturdayAfternoon = true
        } else {
            buttonDESelected(button: saturdayAfternoonButton)
            saturdayAfternoon = false
        }
    }
    @IBAction func saturdayEvening(_ sender: UIButton) {
        if saturdayEvening == false {
            buttonSelected(button: saturdayEveningButton)
            saturdayEvening = true
        } else {
            buttonDESelected(button: saturdayEveningButton)
            saturdayEvening = false
        }
    }
    @IBAction func sundayMorning(_ sender: UIButton) {
        if sundayMorning == false {
            buttonSelected(button: sundayMorningButton)
            sundayMorning = true
        } else {
            buttonDESelected(button: sundayMorningButton)
            sundayMorning = false
        }
    }
    @IBAction func sundayAfternoon(_ sender: UIButton) {
        if sundayAfternoon == false {
            buttonSelected(button: sundayAfternoonButton)
            sundayAfternoon = true
        } else {
            buttonDESelected(button: sundayAfternoonButton)
            sundayAfternoon = false
        }
    }
    @IBAction func sundayEvening(_ sender: UIButton) {
        if sundayEvening == false {
            buttonSelected(button: sundayEveningButton)
            sundayEvening = true
        } else {
            buttonDESelected(button: sundayEveningButton)
            sundayEvening = false
        }
    }
    
    func buttonSelected(button: UIButton) {
        button.setImage(#imageLiteral(resourceName: "checked"), for: .normal)
    }
    
    func buttonDESelected(button: UIButton) {
        button.setImage(#imageLiteral(resourceName: "unchecked"), for: .normal)
    }
    
    @IBAction func localButtontapped(_ sender: UIButton) {
        if local == false && online == true {
            turnOffPreference(button: onlineButton)
            turnOnPreference(button: bothButton)
            local = false
            online = false
            both = true
        } else if local == false {
            turnOnPreference(button: localButton)
            local = true
        } else {
            turnOffPreference(button: localButton)
            local = false
        }
    }
    
    @IBAction func onlineButtonTapped(_ sender: UIButton) {
        if local == true && online == false {
            turnOffPreference(button: localButton)
            turnOnPreference(button: bothButton)
            local = false
            online = false
            both = true
        } else if online == false {
            turnOnPreference(button: onlineButton)
            online = true
        } else {
            turnOffPreference(button: onlineButton)
            online = false
        }
    }
    
    @IBAction func bothButtonTapped(_ sender: UIButton) {
        if both == false {
            turnOnPreference(button: bothButton)
            both = true
        } else {
            turnOffPreference(button: bothButton)
            both = false
        }
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
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
