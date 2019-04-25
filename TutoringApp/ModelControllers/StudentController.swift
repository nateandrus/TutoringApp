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
    let teacherRef = Firestore.firestore().collection("teachers")
    
    var currentUser: Student?
    
    func createStudent(name: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if let error = error {
                print("\(error.localizedDescription)💩💩💩💩💩💩")
                completion(false)
                return
            }
            guard let authdata = authData else { completion(false); return }
            let studentUID = authdata.user.uid
            self.studentRef.document(studentUID).setData([
                "name" : name ,
                "email" : email ,
                "firebaseUID" : studentUID
            ]) { err in
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
    
    func deleteStudent() {
    }
    
    func addConnection() {
    }
    
    func removeConnection() {
    }
    
    func searchTeacherWithID(withTeacherID: DocumentReference, completion: @escaping (Student?) -> Void) {
        
    }
    
}
