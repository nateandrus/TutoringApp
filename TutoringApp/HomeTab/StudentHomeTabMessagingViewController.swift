//
//  StudentHomeTabMessagingViewController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 5/8/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import MessageKit
import MessageInputBar

protocol StudentHomeTabMessagingViewControllerDelegate: class {
    func messageSent()
}

class StudentHomeTabMessagingViewController: MessagesViewController {
    
    var teacherLanding: Teacher?
    var fromChat: Bool = false
    weak var delegate: StudentHomeTabMessagingViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        messageInputBar.delegate = self
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        if let layout = messagesCollectionView.collectionViewLayout as? MessagesCollectionViewFlowLayout {
            layout.textMessageSizeCalculator.outgoingAvatarSize = .zero
            layout.textMessageSizeCalculator.incomingAvatarSize = .zero
        }
        messageInputBar.leftStackView.alignment = .center
        messageInputBar.setLeftStackViewWidthConstant(to: 50, animated: false)
        if let teacher = teacherLanding {
            self.title = teacher.name
        }
    }
}

extension StudentHomeTabMessagingViewController: MessagesDisplayDelegate {
    internal func backgroundColor(for message: MessageType, at indexPath: IndexPath,
                                  in messagesCollectionView: MessagesCollectionView) -> UIColor {
        return MessageController.shared.isFromCurrentSender(message: message as! Message) ? #colorLiteral(red: 0.1674007663, green: 0.4571400597, blue: 0.5598231282, alpha: 1) : UIColor.lightGray
    }
    
    func configureAvatarView(_ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) {
        avatarView.isHidden = true
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
extension StudentHomeTabMessagingViewController: MessagesLayoutDelegate {
    
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
extension StudentHomeTabMessagingViewController: MessagesDataSource {
    
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 0
    }
    
    func currentSender() -> Sender {
        return Sender(id: StudentController.shared.currentUser!.firebaseUID, displayName: StudentController.shared.currentUser!.name)
    }
    
    func numberOfMessages(in messagesCollectionView: MessagesCollectionView) -> Int {
        return 0
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
extension StudentHomeTabMessagingViewController: MessageInputBarDelegate {
    
    func messageInputBar(_ inputBar: MessageInputBar, didPressSendButtonWith text: String) {
        guard let student = StudentController.shared.currentUser, let teacher = teacherLanding else { return }
        let sender = Sender(id: student.firebaseUID, displayName: student.name)
        let uuid = UUID().uuidString
        let message = Message(sender: sender, messageId: uuid, timestamp: Date().timeIntervalSince1970, content: text, senderName: student.name)
        ChatController.shared.createChat(teacher: teacher, student: student, message: message, messageText: text) { (success) in
            if success {
                self.navigationController?.popViewController(animated: true)
                self.delegate?.messageSent()
            }
        }
        inputBar.inputTextView.text = ""
    }
}

