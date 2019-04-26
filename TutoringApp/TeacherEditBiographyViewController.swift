//
//  TeacherEditBiographyViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class TeacherEditBiographyViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var changePasswordButton: UIButton!
    @IBOutlet weak var settingsButton: UIBarButtonItem!
    @IBOutlet weak var changeSubjectsButton: UIButton!
    @IBOutlet weak var changePreferencesButton: UIButton!
    @IBOutlet weak var changeBiographyButton: UIButton!
    @IBOutlet weak var aboutYouTextView: UITextView!
    @IBOutlet weak var qualificationsTextView: UITextView!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
    }
    @IBAction func changePasswordButtonTapped(_ sender: Any) {
    }
    @IBAction func changeSubjectsButtonTapped(_ sender: Any) {
    }
    @IBAction func changePreferencesButtonTapped(_ sender: Any) {
    }
    @IBAction func changeBiographyButtonTapped(_ sender: Any) {
    }
    @IBAction func saveChangesButtonTapped(_ sender: Any) {
    }
}
