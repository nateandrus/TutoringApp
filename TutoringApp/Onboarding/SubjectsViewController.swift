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
    @IBOutlet weak var productManagementButton: UIButton!
    @IBOutlet weak var entrepreneurshipButton: UIButton!
    @IBOutlet weak var economicsButton: UIButton!
    @IBOutlet weak var webdevelopmentButton: UIButton!
    @IBOutlet weak var uxdesignButton: UIButton!
    @IBOutlet weak var iosDevelopementButton: UIButton!
    @IBOutlet weak var javascriptButton: UIButton!
    @IBOutlet weak var pythonButton: UIButton!
    @IBOutlet weak var softwareEngineerButton: UIButton!
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
        businessManagementButton.backgroundColor = .lightGray
        marketingButton.backgroundColor = .lightGray
        productManagementButton.backgroundColor = .lightGray
        entrepreneurshipButton.backgroundColor = .lightGray
        economicsButton.backgroundColor = .lightGray
        webdevelopmentButton.backgroundColor = .lightGray
        uxdesignButton.backgroundColor = .lightGray
        iosDevelopementButton.backgroundColor = .lightGray
        javascriptButton.backgroundColor = .lightGray
        pythonButton.backgroundColor = .lightGray
        softwareEngineerButton.backgroundColor = .lightGray
        accountingButton.backgroundColor = .lightGray
        numberSelectedLabel.text = "0 Selected"
        businessManagementButton.layer.cornerRadius = businessManagementButton.frame.height / 2
        accountingButton.layer.cornerRadius = accountingButton.frame.height / 2
        marketingButton.layer.cornerRadius = marketingButton.frame.height / 2
        productManagementButton.layer.cornerRadius = productManagementButton.frame.height / 2
        entrepreneurshipButton.layer.cornerRadius = entrepreneurshipButton.frame.height / 2
        economicsButton.layer.cornerRadius = economicsButton.frame.height / 2
        webdevelopmentButton.layer.cornerRadius = webdevelopmentButton.frame.height / 2
        uxdesignButton.layer.cornerRadius = uxdesignButton.frame.height / 2
        iosDevelopementButton.layer.cornerRadius = iosDevelopementButton.frame.height / 2
        javascriptButton.layer.cornerRadius = javascriptButton.frame.height / 2
        pythonButton.layer.cornerRadius = pythonButton.frame.height / 2
        softwareEngineerButton.layer.cornerRadius = softwareEngineerButton.frame.height / 2
        nextStepButton.layer.cornerRadius = nextStepButton.frame.height / 2
    }
    
    //Subject Booleans
    var businessManagement: Bool = false
    var accounting: Bool = false
    var marketing: Bool = false
    var productManagement: Bool = false
    var entrepreneurship: Bool = false
    var economics: Bool = false
    var webDevelopement: Bool = false
    var uxDesign: Bool = false
    var iosDevelopement: Bool = false
    var javascript: Bool = false
    var python: Bool = false
    var softwareDevelopement: Bool = false
    
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
        if productManagement == false {
            turnButtonOn(button: productManagementButton)
            productManagement = true
            self.subjects.append("Product Management")
            print(subjects)
        } else {
            turnButtonOff(button: productManagementButton)
            productManagement = false
            self.subjects.removeAll(where: {$0 == "Product Management"})
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
        if python == false {
            turnButtonOn(button: pythonButton)
            python = true
            self.subjects.append("Python")
            print(subjects)
        } else {
            turnButtonOff(button: pythonButton)
            python = false
            self.subjects.removeAll(where: {$0 == "Python"})
            print(subjects)
        }
    }
    @IBAction func softwareEngineerButtonTapped(_ sender: UIButton) {
        if softwareDevelopement == false {
            turnButtonOn(button: softwareEngineerButton)
            softwareDevelopement = true
            self.subjects.append("Software Development")
            print(subjects)
        } else {
            turnButtonOff(button: softwareEngineerButton)
            softwareDevelopement = false
            self.subjects.removeAll(where: {$0 == "Software Development"})
            print(subjects)
        }
    }
    
    func turnButtonOn(button: UIButton) {
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        self.counting = counting + 1
        self.numberSelectedLabel.text = "\(counting) Selected"
    }
    
    func turnButtonOff(button: UIButton) {
        button.backgroundColor = .lightGray
        button.setTitleColor(.black, for: .normal)
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
