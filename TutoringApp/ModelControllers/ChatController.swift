//
//  ChatController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/24/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import UIKit
import Firebase

class ChatController {
    
    static let shared = ChatController()
    
    let DB = Firestore.firestore().collection("chats")
    
    
    var chats: [Chat] = []
    
    func createChat(teacherDocRef: DocumentReference, studentDocRef: DocumentReference, completion: @escaping (Bool) -> Void) {
        
        let documentRef = DB.document()
        let chat = Chat(studentID: studentDocRef, tutorID: teacherDocRef, documentRef: documentRef)
        
        let docData = [
            "studentFirebaseUID" : studentDocRef,
            "teacherFirebaseUID" : teacherDocRef
        ]
        documentRef.setData(docData)
        teacherDocRef.updateData(["messages" : FieldValue.arrayUnion([documentRef])]) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            studentDocRef.updateData(["messages" : FieldValue.arrayUnion([documentRef])]) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                completion(true)
            }
        }
    }
    
    func deleteChat(completion: @escaping (Bool) -> Void) {
        
    }
    
    
    
}
