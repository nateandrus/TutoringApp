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
    
    func isFromCurrentSender(message: Message) -> Bool {
        if message.fromUserID == Auth.auth().currentUser?.uid {
            return true
        } else {
            return false
        }
    }
    
}
