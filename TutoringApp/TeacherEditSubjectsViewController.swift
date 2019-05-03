//
//  TeacherEditSubjectsViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 5/3/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class TeacherEditSubjectsViewController: UIViewController {
    
    @IBOutlet weak var accountingButton: UIButton!
    @IBOutlet weak var businessManagementButton: UIButton!
    @IBOutlet weak var economicsButton: UIButton!
    @IBOutlet weak var entrepreneurshipButton: UIButton!
    @IBOutlet weak var marketingButton: UIButton!
    @IBOutlet weak var salesButton: UIButton!
    @IBOutlet weak var androidDevelopmentButton: UIButton!
    @IBOutlet weak var htmlButton: UIButton!
    @IBOutlet weak var iosDevelopmentButton: UIButton!
    @IBOutlet weak var javascriptButton: UIButton!
    @IBOutlet weak var uxDesignButton: UIButton!
    @IBOutlet weak var webDevelopmentButton: UIButton!
    @IBOutlet weak var saveChangesButton: UIButton!
    
    var subjects: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = TeacherController.shared.currentUser
            else { return }
        self.subjects = user.subjects
        if subjects.contains("Business Management") {
            businessManagementButton.backgroundColor = .black
            businessManagementButton.setTitleColor(.white, for: .normal)
        } else {
            businessManagementButton.backgroundColor = .lightGray
            businessManagementButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Accounting") {
            accountingButton.backgroundColor = .black
            accountingButton.setTitleColor(.white, for: .normal)
        } else {
            accountingButton.backgroundColor = .lightGray
            accountingButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Marketing") {
            marketingButton.backgroundColor = .black
            marketingButton.setTitleColor(.white, for: .normal)
        } else {
            marketingButton.backgroundColor = .lightGray
            marketingButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Sales") {
            salesButton.backgroundColor = .black
            salesButton.setTitleColor(.white, for: .normal)
        } else {
            salesButton.backgroundColor = .lightGray
            salesButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Entrepreneurship") {
            entrepreneurshipButton.backgroundColor = .black
            entrepreneurshipButton.setTitleColor(.white, for: .normal)
        } else {
            entrepreneurshipButton.backgroundColor = .lightGray
            entrepreneurshipButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("iOS Development") {
            iosDevelopmentButton.backgroundColor = .black
            iosDevelopmentButton.setTitleColor(.white, for: .normal)
        } else {
            iosDevelopmentButton.backgroundColor = .lightGray
            iosDevelopmentButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Web Development") {
            webDevelopmentButton.backgroundColor = .black
            webDevelopmentButton.setTitleColor(.white, for: .normal)
        } else {
            webDevelopmentButton.backgroundColor = .lightGray
            webDevelopmentButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("UX Design") {
            uxDesignButton.backgroundColor = .black
            uxDesignButton.setTitleColor(.white, for: .normal)
        } else {
            uxDesignButton.backgroundColor = .lightGray
            uxDesignButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Javascript") {
            javascriptButton.backgroundColor = .black
            javascriptButton.setTitleColor(.white, for: .normal)
        } else {
            javascriptButton.backgroundColor = .lightGray
            javascriptButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("HTML") {
            htmlButton.backgroundColor = .black
            htmlButton.setTitleColor(.white, for: .normal)
        } else {
            htmlButton.backgroundColor = .lightGray
            htmlButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Android Development") {
            androidDevelopmentButton.backgroundColor = .black
            androidDevelopmentButton.setTitleColor(.white, for: .normal)
        } else {
            androidDevelopmentButton.backgroundColor = .lightGray
            androidDevelopmentButton.setTitleColor(.black, for: .normal)
        }
        if subjects.contains("Economics") {
            economicsButton.backgroundColor = .black
            economicsButton.setTitleColor(.white, for: .normal)
        } else {
            economicsButton.backgroundColor = .lightGray
            economicsButton.setTitleColor(.black, for: .normal)
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

    @IBAction func businessManagementButtonTapped(_ sender: Any) {
        if subjects.contains("Business Management") {
            businessManagementButton.backgroundColor = .lightGray
            businessManagementButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Business Management"})
            print(subjects)
        } else {
            businessManagementButton.backgroundColor = .black
            businessManagementButton.setTitleColor(.white, for: .normal)
            subjects.append("Business Management")
            print(subjects)
        }
    }
    @IBAction func accountingButtonTapped(_ sender: Any) {
        if subjects.contains("Accounting") {
            accountingButton.backgroundColor = .lightGray
            accountingButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Accounting"})
            print(subjects)
        } else {
            accountingButton.backgroundColor = .black
            accountingButton.setTitleColor(.white, for: .normal)
            subjects.append("Accounting")
            print(subjects)
        }
    }
    @IBAction func marketingButtonTapped(_ sender: Any) {
        if subjects.contains("Marketing") {
            marketingButton.backgroundColor = .lightGray
            marketingButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Marketing"})
            print(subjects)
        } else {
            marketingButton.backgroundColor = .black
            marketingButton.setTitleColor(.white, for: .normal)
            subjects.append("Marketing")
            print(subjects)
        }
    }
    @IBAction func salesButtonTapped(_ sender: Any) {
        if subjects.contains("Sales") {
            salesButton.backgroundColor = .lightGray
            salesButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Sales"})
            print(subjects)
        } else {
            salesButton.backgroundColor = .black
            salesButton.setTitleColor(.white, for: .normal)
            subjects.append("Sales")
            print(subjects)
        }
    }
    @IBAction func entrepreneurshipButtonTapped(_ sender: Any) {
        if subjects.contains("Entrepreneurship") {
            entrepreneurshipButton.backgroundColor = .lightGray
            entrepreneurshipButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Entrepreneurship"})
            print(subjects)
        } else {
            entrepreneurshipButton.backgroundColor = .black
            entrepreneurshipButton.setTitleColor(.white, for: .normal)
            subjects.append("Entrepreneurship")
            print(subjects)
        }
    }
    @IBAction func economicsButtonTapped(_ sender: Any) {
        if subjects.contains("Economics") {
            economicsButton.backgroundColor = .lightGray
            economicsButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Economics"})
            print(subjects)
        } else {
            economicsButton.backgroundColor = .black
            economicsButton.setTitleColor(.white, for: .normal)
            subjects.append("Economics")
            print(subjects)
        }
    }
    @IBAction func webDevelopmentButtonTapped(_ sender: Any) {
        if subjects.contains("Web Development") {
            webDevelopmentButton.backgroundColor = .lightGray
            webDevelopmentButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Web Development"})
            print(subjects)
        } else {
            webDevelopmentButton.backgroundColor = .black
            webDevelopmentButton.setTitleColor(.white, for: .normal)
            subjects.append("Web Development")
            print(subjects)
        }
    }
    @IBAction func uxDesignButtonTapped(_ sender: Any) {
        if subjects.contains("UX Design") {
            uxDesignButton.backgroundColor = .lightGray
            uxDesignButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "UX Design"})
            print(subjects)
        } else {
            uxDesignButton.backgroundColor = .black
            uxDesignButton.setTitleColor(.white, for: .normal)
            subjects.append("UX Design")
            print(subjects)
        }
    }
    @IBAction func iosDevelopmentButtonTapped(_ sender: Any) {
        if subjects.contains("iOS Development") {
            iosDevelopmentButton.backgroundColor = .lightGray
            iosDevelopmentButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "iOS Development"})
            print(subjects)
        } else {
            iosDevelopmentButton.backgroundColor = .black
            iosDevelopmentButton.setTitleColor(.white, for: .normal)
            subjects.append("iOS Development")
            print(subjects)
        }
    }
    @IBAction func javascriptButtonTapped(_ sender: Any) {
        if subjects.contains("Javascript") {
            javascriptButton.backgroundColor = .lightGray
            javascriptButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Javascript"})
            print(subjects)
        } else {
            javascriptButton.backgroundColor = .black
            javascriptButton.setTitleColor(.white, for: .normal)
            subjects.append("Javascript")
            print(subjects)
        }
    }
    @IBAction func htmlButtonTapped(_ sender: Any) {
        if subjects.contains("HTML") {
            htmlButton.backgroundColor = .lightGray
            htmlButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "HTML"})
            print(subjects)
        } else {
            htmlButton.backgroundColor = .black
            htmlButton.setTitleColor(.white, for: .normal)
            subjects.append("HTML")
            print(subjects)
        }
    }
    @IBAction func androidDevelopmentButtonTapped(_ sender: Any) {
        if subjects.contains("Android Development") {
            androidDevelopmentButton.backgroundColor = .lightGray
            androidDevelopmentButton.setTitleColor(.black, for: .normal)
            subjects.removeAll(where: {$0 == "Android Development"})
            print(subjects)
        } else {
            androidDevelopmentButton.backgroundColor = .black
            androidDevelopmentButton.setTitleColor(.white, for: .normal)
            subjects.append("Android Development")
            print(subjects)
        }
    }
    
    @IBAction func saveChangesButtonTapped(_ sender: Any) {
        guard let user = TeacherController.shared.currentUser else { return }
        TeacherController.shared.updateTeacherSubjects(teacherDocRef: user.selfDocRef, subjects: subjects) { (success) in
            if success {
                UIView.animate(withDuration: 0.3) {
                }
            }
        }
    }
    
}
