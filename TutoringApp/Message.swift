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
    let toUserID: String
    let fromUserID: String
    let timestamp: Double
    
    var dictionary: [String: Any] {
        return [
            "messageText" : messageText,
            "toUserID" : toUserID,
            "fromUserID" : fromUserID,
            "timestamp" : timestamp
        ]
    }
}

extension Message {
    init?(dictionary: [String: Any]) {
        guard let messageText = dictionary["messageText"] as? String,
            let toUserID = dictionary["toUserID"] as? String,
            let fromUserID = dictionary["fromUserID"] as? String,
            let timestamp = dictionary["timestamp"] as? Double
            else { return nil }
        self.init(messageText: messageText, toUserID: toUserID, fromUserID: fromUserID, timestamp: timestamp)
    }
}
