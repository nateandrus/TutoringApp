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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let user = StudentController.shared.currentUser else { return }
        ChatController.shared.fetchChats(student: user) { (success) in
            if success {
                if ChatController.shared.chats.isEmpty {
                    self.noChatsAlertController()
                } else {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let user = StudentController.shared.currentUser else { return }
        ChatController.shared.fetchChats(student: user) { (success) in
            if success {
                if ChatController.shared.chats.isEmpty {
                    self.noChatsAlertController()
                } else {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func noChatsAlertController() {
        let alertController = UIAlertController(title: "You do not have any chats!", message: "To start a chat find a tutor on the home tab and send them a message!", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatController.shared.chats.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.view.frame.height / 8
        return height
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as? StudentMessagingTableViewCell
        let chat = ChatController.shared.chats[indexPath.row]
        TeacherController.shared.loadProfileImageView(userFirebaseUID: chat.teacherUID) { (image) in
            if let image = image {
                cell?.messagingImageView.image = image
            } else {
                cell?.messagingImageView.image = #imageLiteral(resourceName: "default user icon")
            }
        }
        cell?.chatLanding = chat
        return cell ?? UITableViewCell()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMessageDetail" {
            if let index = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? MessageDetailViewController {
                    let chatToSend = ChatController.shared.chats[index.row]
                    destinationVC.chatLanding = chatToSend
                    destinationVC.fromChat = true
                }
            }
        }
    }
}

extension MessageDetailViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
    
    }
}
