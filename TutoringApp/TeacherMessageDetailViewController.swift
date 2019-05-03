//
//  TeacherMessageDetailViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/29/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import MessageKit
import MessageInputBar

class TeacherMessageDetailViewController: MessagesViewController {
    
    
    
    //LandingPad for chat
    var chatLanding: Chat? {
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.leftStackView.alignment = .center
        messageInputBar.setLeftStackViewWidthConstant(to: 50, animated: false)
        guard let chat = chatLanding, let studentName = chat.studentName else { return }
        chat.documentRef.addSnapshotListener { documentSnapshot, error in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            MessageController.shared.fetchMessagesFor(chat: chat.documentRef) { (success) in
                if success {
                    self.messagesCollectionView.reloadData()
                }
            }
            print("Current data: \(data)")
        }
        self.title = studentName
        MessageController.shared.fetchMessagesFor(chat: chat.documentRef) { (success) in
            if success {
                self.messagesCollectionView.reloadData()
            }
        }
    }
    
    
    //    @IBAction func messageSendButtonTapped(_ sender: UIButton) {
    //        if fromChat == false {
    //            guard let messageText = messageTextField.text, !messageText.isEmpty, let teacher = teacherLanding, let currentStudent = StudentController.shared.currentUser else { return }
    //            let sender = Sender(id: currentStudent.firebaseUID, displayName: currentStudent.name)
    //            let uuid = UUID().uuidString
    //            let message = Message(sender: sender, messageId: uuid, sentDate: Date(), kind: .text(messageText), senderName: currentStudent.name, content: m)
    //
    //            ChatController.shared.createChat(teacherDocRef: teacher.selfDocRef, studentDocRef: currentStudent.selfDocRef, message: message, messageText: messageText) { (success) in
    //                if success {
    //                    self.navigationController?.popViewController(animated: true)
    //                }
    //            }
    //        } else {
    //            guard let chat = chatLanding, let messageText = messageTextField.text, !messageText.isEmpty, let user = StudentController.shared.currentUser else { return }
    //            let sender = Sender(id: user.firebaseUID, displayName: user.name)
    //            let uuid = UUID().uuidString
    //            let message = Message(sender: sender, messageId: uuid, sentDate: Date(), kind: .text(messageText), senderName: user.name)
    //
    //            MessageController.shared.addMessageToChat(chatRef: chat.documentRef, message: message) { (success) in
    //                if success {
    //                    MessageController.shared.messages.append(message)
    //                    let index = MessageController.shared.messages.count - 1
    //                    let indexPath = IndexPath(item: index, section: 0)
    //                    self.messagesCollectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
    //                }
    //            }
    //        }
    //    }
}

extension TeacherMessageDetailViewController: MessagesDisplayDelegate {
    private func backgroundColor(for message: Message, at indexPath: IndexPath,
                                 in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return MessageController.shared.isFromCurrentSender(message: message) ? UIColor.lightGray : UIColor.green
    }
    
    func shouldDisplayHeader(for message: MessageType, at indexPath: IndexPath,
                             in messagesCollectionView: MessagesCollectionView) -> Bool {
        return false
    }
    
    func messageStyle(for message: MessageType, at indexPath: IndexPath,
                      in messagesCollectionView: MessagesCollectionView) -> MessageStyle {
        
        let corner: MessageStyle.TailCorner = MessageController.shared.isFromCurrentSender(message: message as! Message) ? .bottomRight : .bottomLeft
        return .bubbleTail(corner, .curved)
    }
}

// MARK: - MessagesLayoutDelegate
extension TeacherMessageDetailViewController: MessagesLayoutDelegate {
    
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
extension TeacherMessageDetailViewController: MessagesDataSource {
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return MessageController.shared.messages.count
    }
    
    func currentSender() -> Sender {
        return Sender(id: TeacherController.shared.currentUser!.firebaseUID, displayName: TeacherController.shared.currentUser!.name)
    }
    
    func numberOfMessages(in messagesCollectionView: MessagesCollectionView) -> Int {
        return MessageController.shared.messages.count
    }
    
    func messageForItem(at indexPath: IndexPath,
                        in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return MessageController.shared.messages[indexPath.section]
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

//MARK: - MessageDisplayDelegate
extension TeacherMessageDetailViewController: MessageInputBarDelegate {
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        guard let teacher = TeacherController.shared.currentUser else { return }
        let sender = Sender(id: teacher.firebaseUID, displayName: teacher.name)
        let uuid = UUID().uuidString
        let message = Message(sender: sender, messageId: uuid, timestamp: Date().timeIntervalSince1970, content: text, senderName: teacher.name)
        guard let chat = chatLanding else { return }
        MessageController.shared.addMessageToChat(chatRef: chat.documentRef, message: message) { (success) in
            if success {
                MessageController.shared.fetchMessagesFor(chat: chat.documentRef, completion: { (success) in
                    if success {
                        self.messagesCollectionView.reloadData()
                    }
                })
            }
        }
        inputBar.inputTextView.text = ""
    }
}


