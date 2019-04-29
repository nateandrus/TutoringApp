//
//  TeacherMessagingTableViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/29/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit

class TeacherMessagingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
