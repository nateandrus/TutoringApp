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
    var sentDate: Date
    var kind: MessageKind
    
    var dictionary: [String: Any] {
        return [
            "sender" : sender,
            "messageID" : messageId,
            "sentDate" : sentDate,
            "kind" : kind
        ]
    }
}

extension Message {
    init?(dictionary: [String: Any]) {
        guard let messageID = dictionary["messageID"] as? String,
            let sender = dictionary["sender"] as? Sender,
            let sentDate = dictionary["sentDate"] as? Date,
            let kind = dictionary["kind"] as? MessageKind
            else { return nil }
        self.init(sender: sender, messageId: messageID, sentDate: sentDate, kind: kind)
    }
}
