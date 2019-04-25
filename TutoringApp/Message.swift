//
//  Message.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/23/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import Foundation

struct Message {
    
    let messageText: String
    let fromUserID: String
    let timestamp: Double
    let senderName: String
    
    var dictionary: [String: Any] {
        return [
            "messageText" : messageText,
            "fromUserID" : fromUserID,
            "timestamp" : timestamp,
            "senderName" : senderName
        ]
    }
}

extension Message {
    init?(dictionary: [String: Any]) {
        guard let messageText = dictionary["messageText"] as? String,
            let fromUserID = dictionary["fromUserID"] as? String,
            let timestamp = dictionary["timestamp"] as? Double,
            let senderName = dictionary["senderName"] as? String
            else { return nil }
        self.init(messageText: messageText, fromUserID: fromUserID, timestamp: timestamp, senderName: senderName)
    }
}
