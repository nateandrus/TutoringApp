//
//  MessageDetailViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/24/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import MessageKit
import MessageInputBar

class MessageDetailViewController: MessagesViewController {

    
    //LandingPad for chat
    var chatLanding: Chat? {
        didSet {
            
        }
    }
    
    var teacherLanding: Teacher?
    var fromChat: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messageInputBar.leftStackView.alignment = .center
        messageInputBar.setLeftStackViewWidthConstant(to: 50, animated: false)
        if let teacher = teacherLanding {
            self.title = teacher.name
        }
        if let chat = chatLanding {
            self.title = chat.teacherName
        }
        guard let chat = chatLanding else { return }
        
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
                    self.messagesCollectionView.scrollToBottom()
                }
            }
            print("Current data: \(data)")
        }
        MessageController.shared.fetchMessagesFor(chat: chat.documentRef) { (success) in
            if success {
                self.messagesCollectionView.reloadData()
                self.messagesCollectionView.scrollToBottom()
            }
        }
    }
}

extension MessageDetailViewController: MessagesDisplayDelegate {
    private func backgroundColor(for message: Message, at indexPath: IndexPath,
                         in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return MessageController.shared.isFromCurrentSender(message: message) ? UIColor.lightGray : #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1)
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
        return MessageController.shared.messages.count
    }

    func currentSender() -> Sender {
        return Sender(id: StudentController.shared.currentUser!.firebaseUID, displayName: StudentController.shared.currentUser!.name)
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
extension MessageDetailViewController: MessageInputBarDelegate {

    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        guard let student = StudentController.shared.currentUser else { return }
        let sender = Sender(id: student.firebaseUID, displayName: student.name)
        let uuid = UUID().uuidString
        let message = Message(sender: sender, messageId: uuid, timestamp: Date().timeIntervalSince1970, content: text, senderName: student.name)
        if fromChat == true {
            guard let chat = chatLanding else { return }
            MessageController.shared.addMessageToChat(chatRef: chat.documentRef, message: message) { (success) in
                if success {
                    MessageController.shared.fetchMessagesFor(chat: chat.documentRef, completion: { (success) in
                        if success {
                            self.messagesCollectionView.reloadData()
                            self.messagesCollectionView.scrollToBottom()
                        }
                    })
                }
            }
        } else {
            guard let teacher = teacherLanding else { return }
            ChatController.shared.createChat(teacher: teacher, student: student, message: message, messageText: text) { (success) in
                if success {
                    
                }
            }
        }
        inputBar.inputTextView.text = ""
    }
}

