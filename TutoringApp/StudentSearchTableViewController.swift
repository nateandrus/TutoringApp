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
    var location: String? 
    
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
    
    
    @IBAction func segmentedControllerChanged(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            self.tableView.reloadData()
        } else if segmentedControl.selectedSegmentIndex == 1 {
            guard let location = location else { return }
            StudentController.shared.sortTeachersByZipcode(location: location)
            self.tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return StudentController.shared.searchResults.count
        } else {
            return StudentController.shared.locationSearchResults.count
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.view.frame.height / 8
        return height
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teacherCell", for: indexPath) as! StudentSearchTableViewCell
        if segmentedControl.selectedSegmentIndex == 0 {
            let teacher = StudentController.shared.searchResults[indexPath.row]
            TeacherController.shared.loadProfileImageView(userFirebaseUID: teacher.firebaseUID) { (image) in
                if let image = image {
                    cell.profileImage.image = image
                } else {
                    cell.profileImage.image = #imageLiteral(resourceName: "default user icon")
                }
            }
            cell.teacher = teacher
            return cell
        } else {
            let teacher = StudentController.shared.locationSearchResults[indexPath.row]
            TeacherController.shared.loadProfileImageView(userFirebaseUID: teacher.firebaseUID) { (image) in
                if let image = image {
                    cell.profileImage.image = image
                } else {
                    cell.profileImage.image = #imageLiteral(resourceName: "default user icon")
                }
            }
            cell.teacher = teacher
            return cell
        }
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
