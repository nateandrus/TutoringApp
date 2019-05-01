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
    
    func createChat(teacherDocRef: DocumentReference, studentDocRef: DocumentReference, message: Message, completion: @escaping (Bool) -> Void) {
        
        let documentRef = DB.document()
        let chat = Chat(studentID: studentDocRef, tutorID: teacherDocRef, documentRef: documentRef)
        
        let docData = [
            "studentFirebaseUID" : studentDocRef,
            "teacherFirebaseUID" : teacherDocRef,
            "selfDocReference" : documentRef
        ]
        
        documentRef.setData(docData)
        
        documentRef.collection("messages").addDocument(data: message.dictionary)
        
        teacherDocRef.updateData(["messages" : FieldValue.arrayUnion([documentRef])]) { (error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            studentDocRef.updateData(["messages" : FieldValue.arrayUnion([documentRef])]) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                    completion(false)
                    return 
                }
                completion(true)
            }
        }
    }
    
    func fetchChats(student: Student, completion: @escaping (Bool) -> Void) {
        self.chats.removeAll()
        for docRef in student.messageRefs {
            docRef.getDocument { (snapshot, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                guard let snapshot = snapshot, let chat = Chat(from: snapshot) else { return }
                self.chats.append(chat)
            }
        }
    }
    
    func deleteChat(completion: @escaping (Bool) -> Void) {
        
    }
    
    
    
}
