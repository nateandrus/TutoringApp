//
//  DriversLicenseViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/25/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class DriversLicenseViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var licenseImageView: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.layer.cornerRadius = submitButton.frame.height / 2 
    }
    
    @IBAction func submitButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func skipButtonTapped(_ sender: UIButton) {
    }
    
}
