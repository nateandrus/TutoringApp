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
    var kind: MessageKind
    var senderName: String
    var content: String
    
    var dictionary: [String: Any] {
        return [
            "sender" : sender.id,
            "messageID" : messageId,
            "sentDate" : sentDate,
            "content" : content,
            "senderName" : senderName
        ]
    }
}

extension Message {
    init?(dictionary: [String: Any]) {
        guard let messageID = dictionary["messageID"] as? String,
            let senderID = dictionary["sender"] as? String,
            let timestamp = dictionary["sentDate"] as? Double,
            let senderName = dictionary["senderName"] as? String,
            let content = dictionary["content"] as? String,
            let kind = dictionary["kind"] as? MessageKind
            else { return nil }
        
        self.timestamp = timestamp
        self.messageId = messageID
        self.kind = kind
        self.senderName = senderName
        self.content = content
        self.sender = Sender(id: senderID, displayName: senderName)
    }
}
