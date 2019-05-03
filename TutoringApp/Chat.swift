//
//  Chat.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/24/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase

class Chat {
    
    let studentID: DocumentReference
    let teacherID: DocumentReference
    let documentRef: DocumentReference
    let messageCollectionRef: CollectionReference
    let messages: [Message]
    var messagePreview: String?
    var timestamp: Double?
    var teacherUID: String
    var studentUID: String
    var studentName: String?
    var teacherName: String?
    
        
    init(studentID: DocumentReference, tutorID: DocumentReference, documentRef: DocumentReference, messages: [Message] = [], teacherUID: String, studentUID: String, teacherName: String, studentName: String) {
        self.studentID = studentID
        self.teacherID = tutorID
        self.documentRef = documentRef
        self.messages = messages
        self.teacherUID = teacherUID
        self.studentUID = studentUID
        self.teacherName = teacherName
        self.studentName = studentName
        self.messageCollectionRef = documentRef.collection("messages")
    }
}

extension Chat {
    
    convenience init?(from snapshot: DocumentSnapshot) {
        let snapshot = snapshot.data()
        
        guard let studentID = snapshot?["studentFirebaseUID"] as? DocumentReference,
            let teacherID = snapshot?["teacherFirebaseUID"] as? DocumentReference,
            let documentRef = snapshot?["selfDocReference"] as? DocumentReference,
            let studentUID = snapshot?["studentUID"] as? String,
            let teacherUID = snapshot?["teacherUID"] as? String,
            let studentName = snapshot?["studentName"] as? String,
            let teacherName = snapshot?["teacherName"] as? String
            else { return nil }
        
        let timestamp = snapshot?["timestamp"] as? Double
        let messagePreview = snapshot?["messagePreview"] as? String
        
        self.init(studentID: studentID, tutorID: teacherID, documentRef: documentRef, messages: [], teacherUID: teacherUID, studentUID: studentUID, teacherName: teacherName, studentName: studentName)
        self.messagePreview = messagePreview
        self.timestamp = timestamp
    }
}

extension Chat: Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.documentRef == rhs.documentRef
    }
}
