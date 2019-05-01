//
//  MessageDetailViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/24/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import MessageKit

class MessageDetailViewController: MessagesViewController {

//    @IBOutlet weak var messagesCollectionView: UICollectionView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var bottomTextFieldConstraint: NSLayoutConstraint!
    
    //LandingPad for chat
    var chatLanding: Chat? {
        didSet {
            
        }
    }
    var teacherLanding: Teacher?
    var fromChat: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(MessageDetailViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(MessageDetailViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillShowNotification)
        NotificationCenter.default.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                        print("Will Show")
            print(keyboardSize.height)
            print(self.view.frame.origin.y)
            self.view.frame.origin.y -= keyboardSize.height - tabBarController!.tabBar.frame.height
        }
    }
    @objc func keyboardWillHide(_ notification:Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            print("Will Hide")
            print(keyboardSize.height)
            print(self.view.frame.origin.y)
            self.view.frame.origin.y += keyboardSize.height - tabBarController!.tabBar.frame.height
            
        }
    }
    
    @IBAction func messageSendButtonTapped(_ sender: UIButton) {
        if fromChat == false {
            guard let messageText = messageTextField.text, !messageText.isEmpty, let teacher = teacherLanding, let currentStudent = StudentController.shared.currentUser else { return }
            let sender = Sender(id: currentStudent.firebaseUID, displayName: currentStudent.name)
            let uuid = UUID().uuidString
            let message = Message(sender: sender, messageId: uuid, sentDate: Date(), kind: .text(messageText))
            
            ChatController.shared.createChat(teacherDocRef: teacher.selfDocRef, studentDocRef: currentStudent.selfDocRef, message: message) { (success) in
                if success {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        } else {
            guard let chat = chatLanding, let messageText = messageTextField.text, !messageText.isEmpty, let user = StudentController.shared.currentUser else { return }
            let sender = Sender(id: user.firebaseUID, displayName: user.name)
            let uuid = UUID().uuidString
            let message = Message(sender: sender, messageId: uuid, sentDate: Date(), kind: .text(messageText))
            
            MessageController.shared.addMessageToChat(chatRef: chat.documentRef, message: message) { (success) in
                if success {
                    MessageController.shared.messages.append(message)
                    let index = MessageController.shared.messages.count - 1
                    let indexPath = IndexPath(item: index, section: 0)
                    self.messagesCollectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
                }
            }
        }
    }
}

//MARK: - MessageDisplayDelegate
extension MessageDetailViewController: MessagesDisplayDelegate {
    private func backgroundColor(for message: Message, at indexPath: IndexPath,
                         in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return MessageController.shared.isFromCurrentSender(message: message) ? UIColor.lightGray : UIColor.green
    }

    func shouldDisplayHeader(for message: Message, at indexPath: IndexPath,
                             in messagesCollectionView: MessagesCollectionView) -> Bool {
        return false
    }

    private func messageStyle(for message: Message, at indexPath: IndexPath,
                      in messagesCollectionView: MessagesCollectionView) -> MessageStyle {

        let corner: MessageStyle.TailCorner = MessageController.shared.isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(corner, .curved)
    }
}

// MARK: - MessagesLayoutDelegate
extension MessageDetailViewController: MessagesLayoutDelegate {

    func avatarSize(for message: Message, at indexPath: IndexPath,
                    in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return .zero
    }

    func footerViewSize(for message: Message, at indexPath: IndexPath,
                        in messagesCollectionView: MessagesCollectionView) -> CGSize {
        return CGSize(width: 0, height: 8)
    }

    func heightForLocation(message: Message, at indexPath: IndexPath,
                           with maxWidth: CGFloat, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        return 0
    }
}

// MARK: - MessagesDataSource
extension MessageDetailViewController: MessagesDataSource {

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 1
    }

    func currentSender() -> Sender {
        return Sender(id: StudentController.shared.currentUser!.firebaseUID, displayName: StudentController.shared.currentUser!.name)
    }

    func numberOfMessages(in messagesCollectionView: MessagesCollectionView) -> Int {
        return MessageController.shared.messages.count
    }

    func messageForItem(at indexPath: IndexPath,
                        in messagesCollectionView: MessagesCollectionView) -> MessageType {

        return MessageController.shared.messages[indexPath.row]
    }

    func cellTopLabelAttributedText(for message: MessageType,
                                    at indexPath: IndexPath) -> NSAttributedString? {

        let name = message.sender.displayName
        return NSAttributedString(
            string: name,
            attributes: [
                .font: UIFont.preferredFont(forTextStyle: .caption1),
                .foregroundColor: UIColor(white: 0.3, alpha: 1)
            ]
        )
    }
}
