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
    
    func createTeacher(name: String, email: String, location: String, messages: [DocumentReference], dateOfBirth: String, subjects: [String], costPerHour: String, schedulePreference: [String], meetingPreference: String, aboutMe: String, qualifications: String, linkedInLink: String, userFirebaseUID: String, profileImage: UIImage?, completion: @escaping (Bool) -> Void) {
        
        let docRef = teacherRef.document(userFirebaseUID)
        
        if let image = profileImage {
            let resizedImage = PhotoResizer.ResizeImage(image: image, targetSize: CGSize(width: 400, height: 400))
            let storage = Storage.storage().reference().child(userFirebaseUID)
            guard let uploadData = resizedImage.pngData() else { return }
            print(resizedImage.size)
            storage.putData(uploadData, metadata: nil) {(metaData, error) in
                if let error = error {
                    print("\(error.localizedDescription)🤬🤬🤬🤬🤬")
                    return
                }
                storage.downloadURL(completion: {(url, error) in
                    if let error = error {
                        print("\(error.localizedDescription)🤬🤬🤬🤬🤬🤬")
                        return
                    }
                })
            }
        }
        
        let newTeacher = Teacher(name: name, email: email, messages: messages, firebaseUID: userFirebaseUID, linkedINLink: linkedInLink, costForTime: costPerHour, qualifications: qualifications, location: location, dateOfBirth: dateOfBirth, subjects: subjects, schedulePref: schedulePreference, meetingPref: meetingPreference, aboutMe: aboutMe, profileImage: nil, profileImageURL: userFirebaseUID, selfDocRef: docRef)
        
        Firestore.firestore().collection("teachers").document(userFirebaseUID).setData(newTeacher.dictionary) { err in
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
    
    func updateTeacher(teacherDocRef: DocumentReference, subjects: [String], costPerHour: String, schedulePreference: [String], meetingPreference: String, aboutMe: String, qualifications: String, completion: @escaping (Bool) -> Void) {
        
        let docData: [String: Any] = [
            "subjects" : subjects,
            "costPerHour" : costPerHour,
            "schedulePreference" : schedulePreference,
            "meetingPreference" : meetingPreference,
            "aboutMe" : aboutMe,
            "qualifications" : qualifications
            ]
        
        teacherDocRef.updateData(docData) { (error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            } else {
                completion(true)
            }
        }
    }
    
    func updateTeacherSubjects(teacherDocRef: DocumentReference, subjects: [String], completion: @escaping (Bool) -> Void) {
        
        let docData: [String: Any] = [
            "subjects" : subjects,
        ]
        
        teacherDocRef.updateData(docData) { (error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            } else {
                completion(true)
            }
        }
    }
    
    func updateTeacherPreferences(teacherDocRef: DocumentReference, costPerHour: String, schedulePreference: [String], meetingPreference: String, completion: @escaping (Bool) -> Void) {
        
        let docData: [String: Any] = [
            "costPerHour" : costPerHour,
            "schedulePreference" : schedulePreference,
            "meetingPreference" : meetingPreference,
        ]
        
        teacherDocRef.updateData(docData) { (error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            } else {
                completion(true)
            }
        }
    }
    
    func updateTeacherBiography(teacherDocRef: DocumentReference, aboutMe: String, qualifications: String, completion: @escaping (Bool) -> Void) {
        
        let docData: [String: Any] = [
            "aboutMe" : aboutMe,
            "qualifications" : qualifications
        ]
        
        teacherDocRef.updateData(docData) { (error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            } else {
                completion(true)
            }
        }
    }
    
    func deleteTeacher() {
    }
    
    func logoutTeacher(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            print("success logging out user!")
            completion(true)
            return
        } catch {
            print(error.localizedDescription)
            completion(false)
            return
        }
    }
    
    func changePassword(email: String, completion: @escaping (Bool) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let error = error {
                print(error.localizedDescription)
                completion(false)
                return
            }
            completion(true)
        }
    }
    
    func searchStudentWithID(withStudentID: DocumentReference, completion: @escaping (Student?) -> Void) {
    }
    
    func changeProfileImage(userFirebaseUID: String, newImage: UIImage, completion: @escaping (Bool) -> Void) {
        
        let docData: [String: Any] = [
            "profileImage" : userFirebaseUID
        ]
        let resizedImage = PhotoResizer.ResizeImage(image: newImage, targetSize: CGSize(width: 400, height: 400))
        let storage = Storage.storage().reference().child(userFirebaseUID)
        guard let uploadData = resizedImage.pngData() else { return }
        print(resizedImage.size)
        storage.putData(uploadData, metadata: nil) {(metaData, error) in
            if let error = error {
                print("\(error.localizedDescription)🤬🤬🤬🤬🤬")
                completion(false)
                return
            } else {
                self.teacherRef.document(userFirebaseUID).updateData(docData, completion: { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                        completion(false)
                        return
                    } else {
                        completion(true)
                    }
                })
            }
        }
    }
    
    func loadProfileImageView(userFirebaseUID: String, completion: @escaping (UIImage?) -> Void) {
        let urlReference = Storage.storage().reference().child(userFirebaseUID)
        urlReference.getData(maxSize: 1 * 1024 * 1024) { (data, error) in
            if let error = error {
                print("Error fetching image from URL :: \(error.localizedDescription)💩💩💩💩💩💩")
                completion(nil)
                return
            }
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion(image)
            return
        }
    }
}
