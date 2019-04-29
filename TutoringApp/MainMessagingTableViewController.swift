//
//  MainMessagingTableViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/23/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import MessageKit

class MainMessagingTableViewController: UITableViewController {
    
    @IBOutlet weak var popoverTableView: UITableView!
    @IBOutlet var popoverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addChatButtonTapped(_ sender: UIBarButtonItem) {
        self.view.addSubview(popoverView)
        self.popoverView.layer.cornerRadius = 20
        self.popoverView.center = self.view.center
    }
    
    @IBAction func popoverCancelButtonTapped(_ sender: UIButton) {
        self.popoverView.removeFromSuperview()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if tableView == popoverTableView {
//            guard let connections = StudentController.shared.currentUser?.connections else { return 0 }
//            return connections.count
//        } else {
            return ChatController.shared.chats.count
//        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        if tableView == popoverTableView {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "connectionCell", for: indexPath)
//            cell.textLabel?.text = StudentController.shared.currentUser?.connections[indexPath.row]
//            return cell
//        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath)
            let index = ChatController.shared.chats[indexPath.row]
            
            return cell
//        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == popoverTableView {
            //start new chat with the person that was selected
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMessageDetail" {
            if let index = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? MessageDetailViewController {
                    let chatToSend = ChatController.shared.chats[index.row]
                    destinationVC.chatLanding = chatToSend
                }
            }
        }
    }
}

extension MessageDetailViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
    }
}
