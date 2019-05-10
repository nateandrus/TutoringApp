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
    
    func createChat(teacher: Teacher, student: Student, message: Message, messageText: String, completion: @escaping (Bool) -> Void) {
        
        let documentRef = DB.document()
        
        let docData: [String: Any] = [
            "studentFirebaseUID" : student.selfDocRef,
            "teacherFirebaseUID" : teacher.selfDocRef,
            "selfDocReference" : documentRef,
            "timestamp" :  Date().timeIntervalSince1970,
            "messagePreview" : messageText,
            "studentUID" : student.firebaseUID,
            "teacherUID" : teacher.firebaseUID,
            "studentName" : student.name,
            "teacherName" : teacher.name
        ]
        
        documentRef.setData(docData)
        documentRef.collection("messages").addDocument(data: message.dictionary)
        teacher.selfDocRef.updateData(["messages" : FieldValue.arrayUnion([documentRef])]) { (error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            student.selfDocRef.updateData(["messageRefs" : FieldValue.arrayUnion([documentRef])]) { (error) in
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
        Firestore.firestore().collection("chats").whereField("studentUID", isEqualTo: student.firebaseUID).getDocuments { (snapshot, error) in
            if let error = error {
                print("that aint gonna work \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let snapshot = snapshot else { completion(false); return }
            for document in snapshot.documents {
                guard let chat = Chat(from: document) else { return }
                self.chats.append(chat)
            }
            completion(true)
        }
    }
    
    func fetchChatsFor(teacher: Teacher, completion: @escaping (Bool) -> Void) {
        self.chats.removeAll()
        Firestore.firestore().collection("chats").whereField("teacherUID", isEqualTo: teacher.firebaseUID).getDocuments { (snapshot, error) in
            if let error = error {
                print("that aint gonna work \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let snapshot = snapshot else { completion(false); return }
            for document in snapshot.documents {
                guard let chat = Chat(from: document) else { return }
                self.chats.append(chat)
            }
            completion(true)
        }
    }
    
    func deleteChat(chatDocRef: DocumentReference, completion: @escaping (Bool) -> Void) {
        chatDocRef.delete { (error) in
            if let error = error {
                print("Error deleting the chat:: \(error.localizedDescription)")
                completion(false)
                return
            } else {
                completion(true)
            }
        }
    }
}
