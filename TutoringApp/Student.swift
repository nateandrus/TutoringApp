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
    let firebaseUID: String
    var messageRefs: [DocumentReference]
    var recentSearches: [String]
    var profileImage: UIImage?
    var selfDocRef: DocumentReference
    
    var dictionary: [String: Any] {
        return [
            "name" : name,
            "email" : email,
            "messageRefs" : messageRefs,
            "firebaseUID" : firebaseUID,
            "recentSearches" : recentSearches,
            "profileImage" : profileImage,
            "selfDocRef" : selfDocRef
        ]
    }
}

extension Student {
    init?(dictionary: [String: Any]) {
        guard let name = dictionary["name"] as? String,
            let email = dictionary["email"] as? String,
            let firebaseUID = dictionary["firebaseUID"] as? String,
            let selfDocRef = dictionary["selfDocRef"] as? DocumentReference,
            let messageRefs = dictionary["messageRefs"] as? [DocumentReference],
            let recentSearches = dictionary["recentSearches"] as? [String]
            else { return nil }
        
        
        let profileImage = dictionary["profileImage"] as? UIImage
        
        
        self.init(name: name, email: email, firebaseUID: firebaseUID, messageRefs: messageRefs, recentSearches: recentSearches, profileImage: profileImage, selfDocRef: selfDocRef)
    }
}
