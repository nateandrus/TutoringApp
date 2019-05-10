//
//  Message.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/23/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import Foundation
import MessageKit

struct Message: MessageType {
    
    var sender: Sender
    var messageId: String
    var sentDate: Date {
        return Date(timeIntervalSince1970: timestamp)
    }
    var timestamp: Double
    var content: String
    var kind: MessageKind {
        return .text(content)
    }
    var senderName: String
    
    var dictionary: [String: Any] {
        return [
            "sender" : sender.id,
            "messageID" : messageId,
            "sentDate" : timestamp,
            "content" : content,
            "senderName" : senderName,
        ]
    }
}

extension Message {
    init?(dictionary: [String: Any]) {
        guard let messageID = dictionary["messageID"] as? String,
            let senderID = dictionary["sender"] as? String,
            let timestamp = dictionary["sentDate"] as? Double,
            let senderName = dictionary["senderName"] as? String,
            let content = dictionary["content"] as? String
            else { return nil }
        
        
        self.timestamp = timestamp
        self.messageId = messageID
        self.senderName = senderName
        self.content = content
        
        self.sender = Sender(id: senderID, displayName: senderName)
    }
}
