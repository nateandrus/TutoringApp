//
//  Task.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/24/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import Foundation

struct Task {
    
    let name: String
    var isComplete: Bool
    let description: String
    let studentID: String
    let teacherID: String
    
    var dictionary: [String: Any] {
        return [
            "name" : name,
            "isComplete" : isComplete,
            "description" : description,
            "studentID" : studentID,
            "teacherID" : teacherID
        ]
    }
}

extension Task {
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
        let isComplete = dictionary["isComplete"] as? Bool,
        let description = dictionary["description"] as? String,
        let studentID = dictionary["studentID"] as? String,
        let teacherID = dictionary["teacherID"] as? String
            else { return nil }
        
        self.init(name: name, isComplete: isComplete, description: description, studentID: studentID, teacherID: teacherID)
    }
}
