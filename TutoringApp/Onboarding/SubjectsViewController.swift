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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    //MARK: - Actions
    @IBAction func businessManagementButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: businessManagementButton)
    }
    
    @IBAction func accountingButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: accountingButton)
    }
    
    @IBAction func marketingButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: marketingButton)
    }
    
    @IBAction func productManagementButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: productManagementButton)
    }
    
    @IBAction func entrprenuershipButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: entrepreneurshipButton)
    }
    
    @IBAction func economicsButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: economicsButton)
    }
    
    @IBAction func webdevelopmentButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: webdevelopmentButton)
    }
    
    @IBAction func uxDesignButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: uxdesignButton)
    }
    
    @IBAction func iosDevelopmentButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: iosDevelopementButton)
    }
    
    @IBAction func javascriptButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: javascriptButton)
    }
    
    @IBAction func pythonButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: pythonButton)
    }
    
    @IBAction func softwareEngineerButtonTapped(_ sender: UIButton) {
        turnButtonOn(button: softwareEngineerButton)
    }
    
    func turnButtonOn(button: UIButton) {
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        self.counting = counting + 1
        self.numberSelectedLabel.text = "\(counting) Selected"
    }
    
    func turnButtonOff(button: UIButton) {
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        self.counting = counting - 1
        self.numberSelectedLabel.text = "\(counting) Selected"
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
