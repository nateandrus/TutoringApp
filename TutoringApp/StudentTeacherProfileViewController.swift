//
//  StudentTeacherProfileViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class StudentTeacherProfileViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var linkedInLabel: UILabel!
    @IBOutlet weak var aboutMeTextView: UITextView!
    @IBOutlet weak var qualificationsTextView: UITextView!
    @IBOutlet weak var mondayTimeLabel: UILabel!
    @IBOutlet weak var tuesdayTimeLabel: UILabel!
    @IBOutlet weak var wednesdayTimeLabel: UILabel!
    @IBOutlet weak var thursdayTimeLabel: UILabel!
    @IBOutlet weak var fridayTimeLabel: UILabel!
    @IBOutlet weak var saturdayTimeLabel: UILabel!
    @IBOutlet weak var sundayTimeLabel: UILabel!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendMessageButton.layer.cornerRadius = sendMessageButton.frame.height / 2

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
    @IBAction func sendMessageButtonTapped(_ sender: Any) {
    }
    
}
