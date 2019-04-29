//
//  StudentController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/22/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import Foundation
import Firebase

class StudentController {
    
    static let shared = StudentController()
    
    //Firebase References
    let studentRef = Firestore.firestore().collection("students")
    
    var currentUser: Student?
    
    func createStudent(name: String, email: String, password: String, messages: [DocumentReference], completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if let error = error {
                print("\(error.localizedDescription)💩💩💩💩💩💩")
                completion(false)
                return
            }
            guard let authdata = authData else { completion(false); return }
            let studentUID = authdata.user.uid
            
            let docRef = self.studentRef.document()
            
            let newStudent = Student(name: name, email: email, firebaseUID: studentUID, messageRefs: [], recentSearches: [], profileImage: nil, selfDocRef: docRef)
            
            self.studentRef.document(studentUID).setData(newStudent.dictionary) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                    completion(false)
                } else {
                    print("Document successfully written!")
                    completion(true)
                }
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (authData, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil, error)
                return
            }
            guard let authData = authData else { completion(nil, error); return }
            let firebaseUID = authData.user.uid
            completion(firebaseUID, nil)
        }
    }
    
    func initializeStudent(firebaseUID: String, completion: @escaping (Bool) -> Void) {
        studentRef.document(firebaseUID).getDocument { (docSnapshot, error) in
            if let error = error {
                print("Could not find a teacher with that userID: \(error.localizedDescription)")
                completion(false)
                return
            } else {
                guard let docSnapshot = docSnapshot else { completion(false); return }
                if docSnapshot.exists {
                    let student = Student(dictionary: docSnapshot.data()!)
                    self.currentUser = student
                    completion(true)
                }
            }
        }
    }
    
    func deleteStudent() {
    }
    
    func addConnection() {
    }
    
    func removeConnection() {
    }
    
    func searchTeacherWithID(withTeacherID: DocumentReference, completion: @escaping (Student?) -> Void) {
        
    }
    
}
