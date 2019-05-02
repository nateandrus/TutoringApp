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
        guard let teacher = teacherLanding else { return }
        self.title = teacher.name
    }
    
    
    @IBAction func messageSendButtonTapped(_ sender: UIButton) {
        if fromChat == false {
            guard let messageText = messageTextField.text, !messageText.isEmpty, let teacher = teacherLanding, let currentStudent = StudentController.shared.currentUser else { return }
            let sender = Sender(id: currentStudent.firebaseUID, displayName: currentStudent.name)
            let uuid = UUID().uuidString
            let message = Message(sender: sender, messageId: uuid, sentDate: Date(), kind: .text(messageText))
            
            ChatController.shared.createChat(teacherDocRef: teacher.selfDocRef, studentDocRef: currentStudent.selfDocRef, message: message, messageText: messageText) { (success) in
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
        if MessageController.shared.messages.isEmpty {
            return 0
        }
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

//MARK: - MessageDisplayDelegate
extension MessageDetailViewController: MessageInputBarDelegate {
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        guard let student = StudentController.shared.currentUser else { return }
        let sender = Sender(id: student.firebaseUID, displayName: student.name)
        let uuid = UUID().uuidString
        let message = Message(sender: sender, messageId: uuid, sentDate: Date(), kind: .text(text))
        
        if fromChat == true {
            guard let chat = chatLanding else { return }
            MessageController.shared.addMessageToChat(chatRef: chat.documentRef, message: message) { (success) in
                if success {
                    
                }
            }
        } else {
            guard let teacher = teacherLanding else { return }
            ChatController.shared.createChat(teacherDocRef: teacher.selfDocRef, studentDocRef: student.selfDocRef, message: message, messageText: text) { (success) in
                if success {
                    
                }
            }
        }
        inputBar.inputTextView.text = ""
    }
}

