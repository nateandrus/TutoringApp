//
//  TeacherMessagingTableViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/29/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase
import MessageKit

class TeacherMessagingTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let teacher = TeacherController.shared.currentUser else { return }
        ChatController.shared.fetchChatsFor(teacher: teacher) { (success) in
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
        let okayAction = UIAlertAction(title: "You have no chats", style: .default) { (_) in
            self.tabBarController?.selectedIndex = 1
        }
        alertController.addAction(okayAction)
        present(alertController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatController.shared.chats.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.view.frame.height / 8
        return height
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as? TeacherMessagingTableViewCell
        let chat = ChatController.shared.chats[indexPath.row]
        TeacherController.shared.loadProfileImageView(userFirebaseUID: chat.studentUID) { (image) in
            if let image = image {
                cell?.messageImageView.image = image
            } else {
                cell?.messageImageView.image = #imageLiteral(resourceName: "default user icon")
            }
        }
        cell?.chatLanding = chat
        return cell ?? UITableViewCell()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMessageDetail" {
            if let index = tableView.indexPathForSelectedRow {
                if let destinationVC = segue.destination as? TeacherMessageDetailViewController {
                    let chatToSend = ChatController.shared.chats[index.row]
                    destinationVC.chatLanding = chatToSend
                }
            }
        }
    }
}

