//
//  SubjectsViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var businessManagementButton: UIButton!
    @IBOutlet weak var accountingButton: UIButton!
    @IBOutlet weak var marketingButton: UIButton!
    @IBOutlet weak var salesButton: UIButton!
    @IBOutlet weak var entrepreneurshipButton: UIButton!
    @IBOutlet weak var economicsButton: UIButton!
    @IBOutlet weak var webdevelopmentButton: UIButton!
    @IBOutlet weak var uxdesignButton: UIButton!
    @IBOutlet weak var iosDevelopementButton: UIButton!
    @IBOutlet weak var javascriptButton: UIButton!
    @IBOutlet weak var htmlButton: UIButton!
    @IBOutlet weak var androidDevelopmentButton: UIButton!
    @IBOutlet weak var numberSelectedLabel: UILabel!
    @IBOutlet weak var nextStepButton: UIButton!
    
    var counting: Int = 0
    
    var subjects: [String] = []
    
    //LandingPads
    var nameLandingPad: String?
    var email: String?
    var profileImage: UIImage?
    var location: String?
    var dateOfBirth: String?
    var userFirebaseUID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberSelectedLabel.text = "0 Selected"
        businessManagementButton.layer.cornerRadius = 4
        accountingButton.layer.cornerRadius = 4
        marketingButton.layer.cornerRadius = 4
        salesButton.layer.cornerRadius = 4
        entrepreneurshipButton.layer.cornerRadius = 4
        economicsButton.layer.cornerRadius = 4
        webdevelopmentButton.layer.cornerRadius = 4
        uxdesignButton.layer.cornerRadius = 4
        iosDevelopementButton.layer.cornerRadius = 4
        javascriptButton.layer.cornerRadius = 4
        htmlButton.layer.cornerRadius = 4
        androidDevelopmentButton.layer.cornerRadius = 4
        nextStepButton.layer.cornerRadius = 5
        businessManagementButton.layer.borderWidth = 2
        businessManagementButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        accountingButton.layer.borderWidth = 2
        accountingButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        marketingButton.layer.borderWidth = 2
        marketingButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        salesButton.layer.borderWidth = 2
        salesButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        entrepreneurshipButton.layer.borderWidth = 2
        entrepreneurshipButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        economicsButton.layer.borderWidth = 2
        economicsButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        webdevelopmentButton.layer.borderWidth = 2
        webdevelopmentButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        uxdesignButton.layer.borderWidth = 2
        uxdesignButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        iosDevelopementButton.layer.borderWidth = 2
        iosDevelopementButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        javascriptButton.layer.borderWidth = 2
        javascriptButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        htmlButton.layer.borderWidth = 2
        htmlButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        androidDevelopmentButton.layer.borderWidth = 2
        androidDevelopmentButton.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
    }
    
    //Subject Booleans
    var businessManagement: Bool = false
    var accounting: Bool = false
    var marketing: Bool = false
    var sales: Bool = false
    var entrepreneurship: Bool = false
    var economics: Bool = false
    var webDevelopement: Bool = false
    var uxDesign: Bool = false
    var iosDevelopement: Bool = false
    var javascript: Bool = false
    var html: Bool = false
    var androidDevelopement: Bool = false
    
    //MARK: - Actions
    @IBAction func businessManagementButtonTapped(_ sender: UIButton) {
        if businessManagement == false {
            turnButtonOn(button: businessManagementButton)
            businessManagement = true
            self.subjects.append("Business Management")
            print(subjects)
        } else {
            turnButtonOff(button: businessManagementButton)
            businessManagement = false
            self.subjects.removeAll(where: {$0 == "Business Management"})
            print(subjects)
        }
    }
    @IBAction func accountingButtonTapped(_ sender: UIButton) {
        if accounting == false {
            turnButtonOn(button: accountingButton)
            accounting = true
            self.subjects.append("Accounting")
            print(subjects)
        } else {
            turnButtonOff(button: accountingButton)
            accounting = false
            self.subjects.removeAll(where: {$0 == "Accounting"})
            print(subjects)
        }
    }
    @IBAction func marketingButtonTapped(_ sender: UIButton) {
        if marketing == false {
            turnButtonOn(button: marketingButton)
            marketing = true
            self.subjects.append("Marketing")
            print(subjects)
        } else {
            turnButtonOff(button: marketingButton)
            marketing = false
            self.subjects.removeAll(where: {$0 == "Marketing"})
            print(subjects)
        }
    }
    @IBAction func productManagementButtonTapped(_ sender: UIButton) {
        if sales == false {
            turnButtonOn(button: salesButton)
            sales = true
            self.subjects.append("Sales")
            print(subjects)
        } else {
            turnButtonOff(button: salesButton)
            sales = false
            self.subjects.removeAll(where: {$0 == "Sales"})
            print(subjects)
        }
    }
    @IBAction func entrprenuershipButtonTapped(_ sender: UIButton) {
        if entrepreneurship == false {
            turnButtonOn(button: entrepreneurshipButton)
            entrepreneurship = true
            self.subjects.append("Entrepreneurship")
            print(subjects)
        } else {
            turnButtonOff(button: entrepreneurshipButton)
            entrepreneurship = false
            self.subjects.removeAll(where: {$0 == "Entrepreneurship"})
            print(subjects)
        }
    }
    @IBAction func economicsButtonTapped(_ sender: UIButton) {
        if economics == false {
            turnButtonOn(button: economicsButton)
            economics = true
            self.subjects.append("Economics")
            print(subjects)
        } else {
            turnButtonOff(button: economicsButton)
            economics = false
            self.subjects.removeAll(where: {$0 == "Economics"})
            print(subjects)
        }
    }
    @IBAction func webdevelopmentButtonTapped(_ sender: UIButton) {
        if webDevelopement == false {
            turnButtonOn(button: webdevelopmentButton)
            webDevelopement = true
            self.subjects.append("Web Development")
            print(subjects)
        } else {
            turnButtonOff(button: webdevelopmentButton)
            webDevelopement = false
            self.subjects.removeAll(where: {$0 == "Web Development"})
            print(subjects)
        }
    }
    @IBAction func uxDesignButtonTapped(_ sender: UIButton) {
        if uxDesign == false {
            turnButtonOn(button: uxdesignButton)
            uxDesign = true
            self.subjects.append("UX Design")
            print(subjects)
        } else {
            turnButtonOff(button: uxdesignButton)
            uxDesign = false
            self.subjects.removeAll(where: {$0 == "UX Design"})
            print(subjects)
        }
    }
    @IBAction func iosDevelopmentButtonTapped(_ sender: UIButton) {
        if iosDevelopement == false {
            turnButtonOn(button: iosDevelopementButton)
            iosDevelopement = true
            self.subjects.append("iOS Development")
            print(subjects)
        } else {
            turnButtonOff(button: iosDevelopementButton)
            iosDevelopement = false
            self.subjects.removeAll(where: {$0 == "iOS Development"})
            print(subjects)
        }
    }
    @IBAction func javascriptButtonTapped(_ sender: UIButton) {
        if javascript == false {
            turnButtonOn(button: javascriptButton)
            javascript = true
            self.subjects.append("Javascript")
            print(subjects)
        } else {
            turnButtonOff(button: javascriptButton)
            javascript = false
            self.subjects.removeAll(where: {$0 == "Javascript"})
            print(subjects)
        }
    }
    @IBAction func pythonButtonTapped(_ sender: UIButton) {
        if html == false {
            turnButtonOn(button: htmlButton)
            html = true
            self.subjects.append("HTML")
            print(subjects)
        } else {
            turnButtonOff(button: htmlButton)
            html = false
            self.subjects.removeAll(where: {$0 == "HTML"})
            print(subjects)
        }
    }
    @IBAction func softwareEngineerButtonTapped(_ sender: UIButton) {
        if androidDevelopement == false {
            turnButtonOn(button: androidDevelopmentButton)
            androidDevelopement = true
            self.subjects.append("Android Development")
            print(subjects)
        } else {
            turnButtonOff(button: androidDevelopmentButton)
            androidDevelopement = false
            self.subjects.removeAll(where: {$0 == "Android Development"})
            print(subjects)
        }
    }
    
    func turnButtonOn(button: UIButton) {
        button.backgroundColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        self.counting = counting + 1
        self.numberSelectedLabel.text = "\(counting) Selected"
    }
    
    func turnButtonOff(button: UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(#colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1), for: .normal)
        self.counting = counting - 1
        self.numberSelectedLabel.text = "\(counting) Selected"
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "toPreferences" {
            if counting == 0 {
                alertController()
                return false
            } else {
                return true
            }
        }
        return true
    }
    func alertController() {
        let alertController = UIAlertController(title: "You shall not pass!", message: "You need to select at least one of these subjects in order to be a mentor!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPreferences" {
            guard let name = nameLandingPad,
                let email = email,
                let location = location,
                let dateofBirth = dateOfBirth,
                let userFirebaseUID = userFirebaseUID else { return }
            if let destinationVC = segue.destination as? PreferencesViewController {
                destinationVC.nameLandingPad = name
                destinationVC.email = email
                destinationVC.location = location
                destinationVC.dateOfBirth = dateofBirth
                destinationVC.profileImage = profileImage
                destinationVC.subjectsLanding = subjects
                destinationVC.userFirebaseUID = userFirebaseUID
            }
        }
    }
}
