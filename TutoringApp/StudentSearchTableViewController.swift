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
    //Outlets from popover view
    @IBOutlet var popoverView: UIView!
    @IBOutlet weak var priceSlider: UISlider!
    @IBOutlet weak var priceFilterLabel: UILabel!
    @IBOutlet weak var distanceSlider: UISlider!
    @IBOutlet weak var distanceFromLabel: UILabel!
    
    var teachers: [Teacher] = []
    var subject: String?
    var location: String? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        segmentedControl.layer.cornerRadius = 6
        guard let subject = subject, let location = location else { return }
        StudentController.shared.searchBySubject(subject: subject) { (success) in
            if success {
                StudentController.shared.sortTeachersByZipcode(location: location, completion: { (success) in
                    if success {
                        self.tableView.reloadData()
                    }
                })
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
           popoverView.removeFromSuperview()
    }
    
    @IBAction func priceSlider(_ sender: UISlider) {
        priceSlider.isContinuous = true
        priceFilterLabel.text = "Max rate: $\(Int(Double(priceSlider.value)))/hr"
    }
    
    @IBAction func distanceSlider(_ sender: UISlider) {
        distanceSlider.isContinuous = true
        distanceFromLabel.text = "\(Int(Double(distanceSlider.value))) Miles"
    }
    
    @IBAction func applyButtontapped(_ sender: UIButton) {
        let priceChange = Int(Double(priceSlider.value))
        let distanceChange = Int(Double(priceSlider.value)) 
        StudentController.shared.applyFiltersOnSearch(priceRange: priceChange, distance: distanceChange) { (success) in
            if success {
                self.popoverView.removeFromSuperview()
                self.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        self.popoverView.removeFromSuperview()
    }
    
    @IBAction func filterButtonTapped(_ sender: Any) {
        self.navigationController?.view.addSubview(popoverView)
        popoverView.layer.borderColor = #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
        popoverView.layer.borderWidth = 2
        popoverView.layer.cornerRadius = 15
        constrainFilterView()
    }
    
    func constrainFilterView() {
        popoverView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: popoverView!, attribute: .bottom, relatedBy: .equal, toItem: self.tableView, attribute: .bottom, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: popoverView!, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.5, constant: 0).isActive = true
        NSLayoutConstraint(item: popoverView!, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 1, constant: 0).isActive = true
    }
    
    @IBAction func segmentedControllerChanged(_ sender: UISegmentedControl) {
        if segmentedControl.selectedSegmentIndex == 0 {
            self.tableView.reloadData()
        } else if segmentedControl.selectedSegmentIndex == 1 {
            if StudentController.shared.locationSearchResults.isEmpty {
                guard let subject = subject else { return }
                noLocalMentorsAlertController(subject: subject)
            } else {
                self.tableView.reloadData()
            }
        }
    }
    
    func noLocalMentorsAlertController(subject: String) {
        let alertController = UIAlertController(title: "This is embarassing...", message: "There are no \(subject) mentors in your area.", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "It's okay", style: .default) { (_) in
            self.segmentedControl.selectedSegmentIndex = 0
        }
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return StudentController.shared.onlineSearchResults.count
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
            let teacher = StudentController.shared.onlineSearchResults[indexPath.row]
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
}

extension StudentSearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let search = searchBar.text else { return }
        StudentController.shared.searchTeacherWithID(searchTerm: search) { (teacher) in
           
        }
    }
}
