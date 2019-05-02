//
//  StudentSearchTableViewController.swift
//  TutoringApp
//
//  Created by Carson Buckley on 4/26/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class StudentSearchTableViewController: UITableViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var teachers: [Teacher] = []
    var subject: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        segmentedControl.layer.cornerRadius = 6
        guard let subject = subject else { return }
        StudentController.shared.searchBySubject(subject: subject) { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        segmentedControl.index(ofAccessibilityElement: 0)
        segmentedControl.index(ofAccessibilityElement: 1)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentController.shared.searchResults.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.view.frame.height / 8
        return height
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teacherCell", for: indexPath) as! StudentSearchTableViewCell
        
        let teacher = StudentController.shared.searchResults[indexPath.row]
        TeacherController.shared.loadProfileImageView(userFirebaseUID: teacher.firebaseUID) { (image) in
            guard let image = image else { return }
            cell.profileImage.image = image
        }
        cell.teacher = teacher
        
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTeacherDetail" {
            if let destinationVC = segue.destination as? StudentTeacherProfileViewController {
                if let index = tableView.indexPathForSelectedRow {
                    let teacherToSend = StudentController.shared.searchResults[index.row]
                    destinationVC.teacher = teacherToSend
                }
            }
        }
    }
    
    
    @IBAction func filterButtonTapped(_ sender: Any) {
        
    }
}

extension StudentSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let search = searchBar.text else { return }
        StudentController.shared.searchTeacherWithID(searchTerm: search) { (teacher) in
           
        }
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
