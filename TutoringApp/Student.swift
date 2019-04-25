//
//  Student.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/22/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import Foundation
import Firebase

struct Student {
    
    var name: String
    var email: String
    var messageRefs: [DocumentReference]
    var connections: [String]
    let firebaseUID: String
    var recentSearches: [String]
    var tasks: [String]
    
    var dictionary: [String: Any] {
        return [
            "name" : name,
            "email" : email,
            "messageRefs" : messageRefs,
            "connections" : connections,
            "firebaseUID" : firebaseUID,
            "recentSearches" : recentSearches,
            "tasks" : tasks
        ]
    }
}

extension Student {
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String,
            let messageRefs = dictionary["messages"] as? [DocumentReference],
            let connections = dictionary["connections"] as? [String],
            let firebaseUID = dictionary["firebaseUID"] as? String,
            let recentSearches = dictionary["recentSearches"] as? [String],
            let tasks = dictionary["tasks"] as? [String]
            else { return nil }
        self.init(name: name, email: email, messageRefs: messageRefs, connections: connections, firebaseUID: firebaseUID, recentSearches: recentSearches, tasks: tasks)
    }
}
