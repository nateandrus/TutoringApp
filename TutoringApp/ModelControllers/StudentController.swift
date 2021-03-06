//
//  StudentController.swift
//  TutoringApp
//
//  Created by Nathan Andrus on 4/22/19.
//  Copyright © 2019 Nathan Andrus. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class StudentController {
    
    static let shared = StudentController()
    
    //Firebase References
    let studentRef = Firestore.firestore().collection("students")
    
    var currentUser: Student?
    
    //Source of Truth
    var searchResults: [Teacher] = []
    var locationSearchResults: [Teacher] = []
    var onlineSearchResults: [Teacher] = []
    
    func createStudent(name: String, email: String, password: String, messages: [DocumentReference], completion: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (authData, error) in
            if let error = error {
                print("\(error.localizedDescription)💩💩💩💩💩💩")
                completion(false)
                return
            }
            guard let authdata = authData else { completion(false); return }
            let studentUID = authdata.user.uid
            
            let docRef = self.studentRef.document(studentUID)
            
            let newStudent = Student(name: name, email: email, firebaseUID: studentUID, messageRefs: [], recentSearches: [], profileImage: nil, selfDocRef: docRef)
            
            self.currentUser = newStudent
            
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
    
    func signOutStudent(completion: @escaping (Bool) -> Void) {
        do {
            try Auth.auth().signOut()
            print("SUCCESS LOGGING OUT")
            completion(true)
        } catch let error {
            print("Failed to log out with error, \(error.localizedDescription) ❌❌❌❌❌❌")
            completion(false)
        }
    }
    
    func changeProfilePicture(userFirebaseUID: String, profileImage: UIImage?) {
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
    }
    
    func updatePassword(email: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("FAILED TO SEND AN EMAIL TO THE USER \(error.localizedDescription) ❌❌❌❌❌❌")
                completion(false, error)
                return
            } else {
                print("SUCCESS SENDING THE EMAIL TO USER ✅✅✅✅✅✅")
                completion(true, nil)
            }
        }
    }
    
    func deleteStudent(user: User, student: Student, completion: @escaping (Bool) -> Void) {
        
        user.delete { (error) in
            if let error = error {
                print("THERE WAS AN ERROR DELETING THE USER \(error.localizedDescription) ❌❌❌❌❌❌")
                completion(false)
                return
            } else {
                for chat in student.messageRefs {
                    chat.delete()
                }
                student.selfDocRef.delete(completion: { (error) in
                    if let error = error {
                        print("THERE WAS AN ERROR DELETING THE USER \(error.localizedDescription) ❌❌❌❌❌❌")
                        completion(false)
                        return
                    } else {
                        print("SUCCESS DELETING USER ✅✅✅✅✅✅")
                        completion(true)
                    }
                })
            }
        }
    }
    
    func searchTeacherWithID(searchTerm: String, completion: @escaping ([Teacher]?) -> Void) {
        Firestore.firestore().collection("teachers").whereField("name", isEqualTo: searchTerm).getDocuments { (snapshots, error) in
            if let error = error {
                print("THERE WAS AN ERROR SEARCHING FOR USER ❌❌❌❌❌❌")
                completion(nil)
                return
            }
            self.searchResults.removeAll()
            
            for document in snapshots!.documents {
                guard let teacher = Teacher(dictionary: document.data()) else { return }
                self.searchResults.append(teacher)
            }
        }
    }
    
    func searchBySubject(subject: String, studentFirebaseUID: String, completion: @escaping (Bool) -> Void) {
        Firestore.firestore().collection("teachers").whereField("subjects", arrayContains: subject).getDocuments { (snapshots, error) in
            if let error = error {
                print("THERE WAS AN ERROR SEARCHING FOR USER ❌❌❌❌❌❌\(error)")
                completion(false)
                return
            }
            self.searchResults.removeAll()
            for document in snapshots!.documents {
                guard let teacher = Teacher(dictionary: document.data()) else {
                    print("🤬")
                    return
                }
                if teacher.blockedUsersFirebase.contains(studentFirebaseUID) {
                    continue
                } else {
                    self.searchResults.append(teacher)
                    print("\(document == snapshots?.documents.last)")
                }
            }
            completion(true)
        }
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
                self.studentRef.document(userFirebaseUID).updateData(docData, completion: { (error) in
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
    
    func sortTeachersByZipcode(location: String, completion: @escaping (Bool) -> Void) {
        self.locationSearchResults.removeAll()
        self.onlineSearchResults.removeAll()
        for teacher in searchResults {
            if teacher.meetingPref == "Both" {
                self.onlineSearchResults.append(teacher)
                if teacher.location == location {
                    self.locationSearchResults.append(teacher)
                }
            } else if teacher.meetingPref == "Online" {
                self.onlineSearchResults.append(teacher)
            } else if teacher.meetingPref == "Local" {
                if teacher.location == location {
                    self.locationSearchResults.append(teacher)
                }
            }
        }
        completion(true)
    }
    
    func applyFiltersOnSearch(priceRange: Int, distance: Int, completion: @escaping (Bool) -> Void) {
        for teacher in locationSearchResults {
            if teacher.costForTime > priceRange {
                self.locationSearchResults.removeAll(where:{$0.firebaseUID == teacher.firebaseUID})
            }
        }
        for teacher in onlineSearchResults {
            if teacher.costForTime > priceRange {
                self.onlineSearchResults.removeAll(where:{$0.firebaseUID == teacher.firebaseUID})
            }
        }
        completion(true)
    }
}
