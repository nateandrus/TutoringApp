//
//  MessageController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/23/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase

class MessageController {
    
    static let shared = MessageController()
    
    var messages: [Message] = []
    
    func sendMessage(message: Message, completion: @escaping (Bool) -> Void) {
        
    }
    
    func addMessageToChat(chatRef: DocumentReference, message: Message, completion: @escaping (Bool) -> Void) {
        let messageRef = chatRef.collection("messages").document()
        chatRef.collection("messages").document("\(messageRef)").setData(message.dictionary) { (error) in
            if let error = error {
                print("Error saving message to chat:: \(error.localizedDescription)")
                completion(false)
                return
            } else {
                completion(true)
            }
        }
    }
    
    func fetchMessagesFor(chat: DocumentReference, completion: @escaping (Bool) -> Void) {
        chat.collection("messages").getDocuments { (snapshot, error) in
            if let error = error {
                print("error fetching messages for chat:: \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let snapshot = snapshot else { completion(false); return }
            for document in snapshot.documents {
                guard let message = Message(dictionary: document.data()) else { return }
                self.messages.append(message)
            }
        }
    }
    
    func isFromCurrentSender(message: Message) -> Bool {
        if message.sender.id == Auth.auth().currentUser?.uid {
            return true
        } else {
            return false
        }
    }
    
}
