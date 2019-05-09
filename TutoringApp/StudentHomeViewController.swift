//
//  StudentHomeViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class StudentHomeViewController: UIViewController {
    
    @IBOutlet weak var zipcodeTextField: UITextField!
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
    @IBOutlet weak var androidDevelopmentButton: UIButton!
    @IBOutlet weak var htmlButton: UIButton!
    
    var navigationBarAppearance = UINavigationBar.appearance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zipcodeTextField.layer.cornerRadius = 5
        zipcodeTextField.layer.borderWidth = 2
        zipcodeTextField.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        businessManagementButton.layer.cornerRadius = 5
        accountingButton.layer.cornerRadius = 5
        marketingButton.layer.cornerRadius = 5
        productManagementButton.layer.cornerRadius = 5
        entrepreneurshipButton.layer.cornerRadius = 5
        economicsButton.layer.cornerRadius = 5
        webDevelopmentButton.layer.cornerRadius = 5
        uxDesignButton.layer.cornerRadius = 5
        iosDevelopmentButton.layer.cornerRadius = 5
        javascriptButton.layer.cornerRadius = 5
        androidDevelopmentButton.layer.cornerRadius = 5
        htmlButton.layer.cornerRadius = 5
        
        //navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.protegeBlue]
        //navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 37.5)]
        //navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 37.5)!]
        
        self.navigationItem.title = "protégé"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 37.5)!]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 37.5)]
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.protegeBlue]
    }

    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard let locationText = zipcodeTextField.text, !locationText.isEmpty else {
            zipcodeAlertController()
            return false
        }
        return true
    }
    
    func zipcodeAlertController() {
        let alertcontroller = UIAlertController(title: "Don't forget your zipcode", message: "Enter your zipcode so we can search your area for mentors in the given category!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .cancel, handler: nil)
        alertcontroller.addAction(okayAction)
        present(alertcontroller, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let locationText = zipcodeTextField.text, !locationText.isEmpty else { return }
        if segue.identifier == "toHTML" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "HTML"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toAccounting" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "Accounting"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toAndroidDevelopment" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "Android Development"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toMarketing" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "Marketing"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toEconomics" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "Economics"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toEntrepreneurship" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "Entrepreneurship"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toWebDevelopment" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "Web Development"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toUXDesign" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "UX Design"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toBusinessManagement" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "Business Management"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toSales" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "Sales"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toJavascript" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "Javascript"
            destinationVC?.location = locationText
        }
        if segue.identifier == "toIOSDevelopment" {
            let destinationVC = segue.destination as? StudentSearchTableViewController
            destinationVC?.subject = "iOS Development"
            destinationVC?.location = locationText
        }
    }
}
