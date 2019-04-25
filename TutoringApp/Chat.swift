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
    
    let id: String?
    let studentID: DocumentReference
    let tutorID: DocumentReference
    let documentRef: DocumentReference
    let messages: CollectionReference
    
    init(studentID: DocumentReference, tutorID: DocumentReference, documentRef: DocumentReference) {
        id = nil
        self.studentID = studentID
        self.tutorID = tutorID
        self.documentRef = documentRef
        self.messages = documentRef.collection("messages")
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        guard let studentID = data["studentID"] as? DocumentReference,
        let tutorID = data["tutorID"] as? DocumentReference,
        let documentRef = data["documentRef"] as? DocumentReference,
        let messages = data["messages"] as? CollectionReference
        else {
            return nil
        }
        id = document.documentID
        self.studentID = studentID
        self.tutorID = tutorID
        self.documentRef = documentRef
        self.messages = messages
    }
}

extension Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.id == rhs.id
    }
}
