//
//  StudentHomeViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class StudentHomeViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationController?.navigationBar.isHidden = true
        searchBar.layer.cornerRadius = 50
        businessManagementButton.layer.cornerRadius = businessManagementButton.frame.height / 2
        accountingButton.layer.cornerRadius = accountingButton.frame.height / 2
        marketingButton.layer.cornerRadius = marketingButton.frame.height / 2
        productManagementButton.layer.cornerRadius = productManagementButton.frame.height / 2
        entrepreneurshipButton.layer.cornerRadius = entrepreneurshipButton.frame.height / 2
        economicsButton.layer.cornerRadius = economicsButton.frame.height / 2
        webDevelopmentButton.layer.cornerRadius = webDevelopmentButton.frame.height / 2
        uxDesignButton.layer.cornerRadius = uxDesignButton.frame.height / 2
        iosDevelopmentButton.layer.cornerRadius = iosDevelopmentButton.frame.height / 2
        javascriptButton.layer.cornerRadius = javascriptButton.frame.height / 2
        pythonButton.layer.cornerRadius = pythonButton.frame.height / 2
        softwareEngineerButton.layer.cornerRadius = softwareEngineerButton.frame.height / 2
        
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

}
