//
//  StudentTeacherProfileViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class StudentTeacherProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var linkedInLabel: UILabel!
    @IBOutlet weak var aboutMeLabel: UILabel!
    @IBOutlet weak var qualificationsLabel: UILabel!
    @IBOutlet weak var mondayTimeLabel: UILabel!
    @IBOutlet weak var tuesdayTimeLabel: UILabel!
    @IBOutlet weak var wednesdayTimeLabel: UILabel!
    @IBOutlet weak var thursdayTimeLabel: UILabel!
    @IBOutlet weak var fridayTimeLabel: UILabel!
    @IBOutlet weak var saturdayTimeLabel: UILabel!
    @IBOutlet weak var sundayTimeLabel: UILabel!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    var profilePicture: UIImage? {
        didSet {
            profileImage.image = profilePicture
            guard let user = StudentController.shared.currentUser, let newImage = profilePicture else { return }
            StudentController.shared.changeProfileImage(userFirebaseUID: user.firebaseUID, newImage: newImage) { (success) in
                if success {
                    print("Success uploading photo to firebase storage")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let selectedTeacher = TeacherController.shared.currentUser else { return }
        nameLabel.text = selectedTeacher.name
        locationLabel.text = selectedTeacher.location
        priceLabel.text = selectedTeacher.costForTime
        linkedInLabel.text = selectedTeacher.linkedINLink
        aboutMeLabel.text = selectedTeacher.aboutMe
        qualificationsLabel.text = selectedTeacher.qualifications
        //        mondayTimeLabel.text = selectedTeacher.schedulePref
        //        tuesdayTimeLabel.text = selectedTeacher.schedulePref
        //        wednesdayTimeLabel.text = selectedTeacher.schedulePref
        //        thursdayTimeLabel.text = selectedTeacher.schedulePref
        //        fridayTimeLabel.text = selectedTeacher.schedulePref
        //        saturdayTimeLabel.text = selectedTeacher.schedulePref
        //        sundayTimeLabel.text = selectedTeacher.schedulePref
        
        sendMessageButton.layer.cornerRadius = sendMessageButton.frame.height / 2
        TeacherController.shared.loadProfileImageView(userFirebaseUID: selectedTeacher.firebaseUID) { (image) in
            guard let image = image else { return }
            self.profileImage.image = image
        }
        
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
    
    //Instantiating the MessageViewController
    @IBAction func sendMessageButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "MessagingTab", bundle: nil)
        let messagingScreen = storyBoard.instantiateViewController(withIdentifier: "messagingScreen")
        self.navigationController?.pushViewController(messagingScreen, animated: true)
        
    }
}



//po StudentController.shared.searchResults
//▿ 1 element
//    ▿ 0 : Teacher
//- name : "johnny"
//- email : "johnnyyy@gmail.com"
//▿ messages : Optional<Array<FIRDocumentReference>>
//- some : 0 elements
//- firebaseUID : "gK8ihhAttlPOYWaOMtTed0DoZfu1"
//▿ linkedINLink : Optional<String>
//- some : "www.linkedin.com/johnnyyyyy"
//- costForTime : "33"
//- qualifications : "How goes it qualificationssssssssss"
//- location : "highland, Utah "
//- dateOfBirth : "may "
//▿ subjects : 2 elements
//- 0 : "Accounting"
//- 1 : "Entrepreneurship"
//▿ schedulePref : 2 elements
//- 0 : "FridayAfternoon"
//- 1 : "MondayEvening"
//- meetingPref : "Both"
//- aboutMe : "This is an about you johnnnnyyyyyy boy \t"
//- profileImage : nil
//▿ profileImageURL : Optional<String>
//- some : "gK8ihhAttlPOYWaOMtTed0DoZfu1"
//- selfDocRef : <FIRDocumentReference: 0x6000032e3ee0>
