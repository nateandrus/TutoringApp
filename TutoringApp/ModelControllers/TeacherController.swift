//
//  TeacherController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/22/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import Foundation
import Firebase

class TeacherController {
    
    static let shared = TeacherController()
    
    let teacherRef = Firestore.firestore().collection("teachers")
    
    var currentUser: Teacher?
    
    func createAuthorizedTeacherUser(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if let error = error {
                print("\(error.localizedDescription)💩💩💩💩💩💩💩💩💩")
                completion(nil, error)
                return
            }
            guard let authData = authData else { completion(nil, error); return }
            let userFirebaseUID = authData.user.uid
            completion(userFirebaseUID, nil)
        }
    }
    
    func createTeacher(name: String, email: String, location: String, dateOfBirth: String, subjects: [String], costPerHour: String, schedulePreference: [String], meetingPreference: String, aboutMe: String, qualifications: String, linkedInLink: String, userFirebaseUID: String, profileImage: UIImage?, completion: @escaping (Bool) -> Void) {
        
        let newTeacher = Teacher(name: name, email: email, messages: nil, firebaseUID: userFirebaseUID, linkedINLink: linkedInLink, costForTime: costPerHour, qualifications: qualifications, location: location, dateOfBirth: dateOfBirth, subjects: subjects, schedulePref: schedulePreference, meetingPref: meetingPreference, aboutMe: aboutMe, profileImage: profileImage)
        
        let docData: [String: Any] = [
            "name" : name,
            "email" : email,
            "location": location,
            "dateOfBirth" : dateOfBirth,
            "subjects" : subjects,
            "costPerHour" : costPerHour,
            "schedulePreference" : schedulePreference,
            "meetingPreference": meetingPreference,
            "aboutMe" : aboutMe,
            "qualifications" : qualifications,
            "linkedInLink" : linkedInLink,
            "userFirebaseUID" : userFirebaseUID
        ]
        Firestore.firestore().collection("teachers").document(userFirebaseUID).setData(docData) { err in
            if let error = err {
                print("Error writing document: \(error.localizedDescription)💩💩💩💩💩💩")
                completion(false)
                return
            } else {
                print("Success writing document!!✅✅✅✅✅✅✅")
                self.currentUser = newTeacher
                completion(true)
            }
        }
    }
    
    func initializeTeacher(firebaseUID: String, completion: @escaping (Bool) -> Void) {
        teacherRef.document(firebaseUID).getDocument { (docSnapshot, error) in
            if let error = error {
                print("Could not find a teacher with that userID: \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let docSnapshot = docSnapshot else { completion(false); return }
            if docSnapshot.exists {
                let teacher = Teacher(dictionary: docSnapshot.data()!)
                self.currentUser = teacher
                completion(true)
            }
        }
    }
    
    func deleteTeacher() {
        
    }
    
    func searchStudentWithID(withStudentID: DocumentReference, completion: @escaping (Student?) -> Void) {
        
    }
    
}
