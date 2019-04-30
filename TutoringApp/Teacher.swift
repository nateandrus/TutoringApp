//
//  Teacher.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/22/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase

struct Teacher {
    
    var name: String
    var email: String
    var messages: [DocumentReference]?
    let firebaseUID: String
    let linkedINLink: String?
    var costForTime: String
    var qualifications: String
    var location: String
    var dateOfBirth: String
    var subjects: [String]
    var schedulePref: [String]
    var meetingPref: String
    var aboutMe: String
    var profileImage: UIImage?
    var profileImageURL: String?
    var selfDocRef: DocumentReference
    
    var dictionary: [String: Any] {
        return [
            "name" : name,
            "email" : email,
            "messages" : messages,
            "aboutMe" : aboutMe,
            "userFirebaseUID" : firebaseUID,
            "linkedInLink" : linkedINLink,
            "costPerHour" : costForTime,
            "qualifications" : qualifications,
            "location" : location,
            "meetingPreference" : meetingPref,
            "schedulePreference" : schedulePref,
            "profileImage" : profileImageURL,
            "subjects" : subjects,
            "dateOfBirth" : dateOfBirth,
            "selfDocRef" : selfDocRef
        ]
    }
}

extension Teacher {
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String,
            let aboutMe = dictionary["aboutMe"] as? String,
            let firebaseUID = dictionary["userFirebaseUID"] as? String,
            let linkedInLink = dictionary["linkedInLink"] as? String,
            let costForTime = dictionary["costPerHour"] as? String,
            let qualifications = dictionary["qualifications"] as? String,
            let location = dictionary["location"] as? String,
            let meetingPreference = dictionary["meetingPreference"] as? String,
            let schedulePreference = dictionary["schedulePreference"] as? [String],
            let subjects = dictionary["subjects"] as? [String],
            let dateOfBirth = dictionary["dateOfBirth"] as? String,
            let selfDocRef = dictionary["selfDocRef"] as? DocumentReference
            else { return nil }
        
        let messages = dictionary["messages"] as? [DocumentReference]
        let profileImage = dictionary["profileImage"] as? String
        
        self.init(name: name, email: email, messages: messages, firebaseUID: firebaseUID, linkedINLink: linkedInLink, costForTime: costForTime, qualifications: qualifications, location: location, dateOfBirth: dateOfBirth, subjects: subjects, schedulePref: schedulePreference, meetingPref: meetingPreference, aboutMe: aboutMe, profileImage: nil, profileImageURL: profileImage, selfDocRef: selfDocRef)
    }
}

