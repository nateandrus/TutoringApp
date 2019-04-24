//
//  Teacher.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/22/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import Foundation
import Firebase

struct Teacher {
    
    var name: String
    var email: String
    var messages: [String]
    var connections: [String]
    let firebaseUID: String
    let linkedINLink: String
    var costForTime: String
    var qualifications: String
    var experience: String
    
    var dictionary: [String: Any] {
        return [
            "name" : name,
            "email" : email,
            "messages" : messages,
            "connections" : connections,
            "firebaseUID" : firebaseUID,
            "linkedINLink" : linkedINLink,
            "costForTime" : costForTime,
            "qualifications" : qualifications,
            "experience" : experience
        ]
    }
}

extension Teacher {
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String,
            let messages = dictionary["messages"] as? [String],
            let connections = dictionary["connections"] as? [String],
            let firebaseUID = dictionary["firebaseUID"] as? String,
            let linkedInLink = dictionary["linkedInLink"] as? String,
            let costForTime = dictionary["costForTime"] as? String,
            let qualifications = dictionary["qualifications"] as? String,
            let experience = dictionary["experience"] as? String
            else { return nil }
        self.init(name: name, email: email, messages: messages, connections: connections, firebaseUID: firebaseUID, linkedINLink: linkedInLink, costForTime: costForTime, qualifications: qualifications, experience: experience)
    }
}

