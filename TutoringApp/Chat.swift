//
//  Chat.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/24/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase

struct Chat {
    
    let studentID: DocumentReference
    let teacherID: DocumentReference
    let documentRef: DocumentReference
    let messages: CollectionReference
        
    init(studentID: DocumentReference, tutorID: DocumentReference, documentRef: DocumentReference) {
        self.studentID = studentID
        self.teacherID = tutorID
        self.documentRef = documentRef
        self.messages = documentRef.collection("messages")
    }
    
}

extension Chat {
    
    init?(from snapshot: DocumentSnapshot) {
        let snapshot = snapshot.data()
        
        guard let studentID = snapshot?["studentID"] as? DocumentReference,
            let teacherID = snapshot?["teacherID"] as? DocumentReference,
            let documentRef = snapshot?["documentRef"] as? DocumentReference,
            let messages = snapshot?["messages"] as? CollectionReference
            else { return nil }
        self.studentID = studentID
        self.teacherID = teacherID
        self.documentRef = documentRef
        self.messages = messages
    }
}

extension Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.documentRef == rhs.documentRef
    }
}
