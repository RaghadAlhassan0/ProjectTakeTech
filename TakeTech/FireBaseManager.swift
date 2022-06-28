//
//  FireBaseManager.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 22/11/1443 AH.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth


class FireBaseManager: NSObject , ObservableObject {
    
    @Published var consultants : [User] = []
    @Published var consultant = User(id: "", ImageURL: "", imageVideoName: "", name: "", noOFconsultations: 0, description: "", major: "", price: 0, minutes: 0)
    @Published var selectedConsultant = User(id: "", ImageURL: "", imageVideoName: "", name: "", noOFconsultations: 0, description: "", major: "", price: 0, minutes: 0)
    @Published var currentUser = User(id: "", ImageURL: "", imageVideoName: "", name: "", noOFconsultations: 0, description: "", major: "", price: 0, minutes: 0)
    @AppStorage("isConsultant") var isConsultant: Bool = false
    @AppStorage("hasSeenOnboardingView") var hasSeenOnboardingView: Bool = false
    @Published var isShowingOnboardingView: Bool = false
    @Published var isShowingRegistrationView: Bool = false
    
    let auth: Auth
    let firestore: Firestore
    let storage: Storage
    
    override init(){
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
        self.storage = Storage.storage()
        super.init()
        fetchCurrentUser()
        fetchConsultants()
    }
    
    
    func fetchConsultant(consultantId: String) {
        firestore.collection("consultants").document(consultantId).getDocument { documentSnapshot, error in
            if let error = error {
                print("Error while fetching current account for consultants \(error.localizedDescription)")
            }
            guard let dataDic = documentSnapshot?.data() else {return}
            self.consultant.id                   = dataDic["id"] as? String ?? ""
            self.consultant.ImageURL             = dataDic["ImageURL"] as? String ?? ""
            self.consultant.imageVideoName       = dataDic["imageVideoName"] as? String ?? ""
            self.consultant.name                 = dataDic["name"] as? String ?? ""
            self.consultant.rating               = dataDic["rating"] as? Double ?? 0.0
            self.consultant.noOFconsultations    = dataDic["noOFconsultations"] as? Int ?? 0
            self.consultant.description          = dataDic["description"] as? String ?? ""
            self.consultant.major                = dataDic["major"] as? String ?? ""
            self.consultant.price                = dataDic["price"] as? Int ?? 0
            self.consultant.email                = dataDic["email"] as? String ?? ""
            self.consultant.minutes              = dataDic["minutes"] as? Int ?? 0
            self.consultant.favoriteIds          = dataDic["favoriteIds"] as? [String] ?? []
            self.consultant.isConsultant         = dataDic["isConsultant"] as? Bool ?? false
            self.consultant.phoneNumber          = dataDic["phoneNumber"] as? String ?? ""
            self.consultant.documents            = dataDic["documents"] as? [String] ?? []
            print("DEBUG: successfully fetched user data \(self.currentUser)")
        }
    }
    func fetchConsultants() {
        firestore.collection("consultants").addSnapshotListener { snapshot , error in
//            guard let users = snapshot?.documents.compactMap({ queryDocumentSnapshot in try? queryDocumentSnapshot.data(as: User.self)}) else {return}
            guard let snapshot = snapshot else {return}
            for document in snapshot.documents {
                let dataDic = document.data()
                let id                   = dataDic["id"] as? String ?? ""
                let ImageURL             = dataDic["ImageURL"] as? String ?? ""
                let imageVideoName       = dataDic["imageVideoName"] as? String ?? ""
                let name                 = dataDic["name"] as? String ?? ""
                let rating               = dataDic["rating"] as? Double ?? 0.0
                let noOFconsultations    = dataDic["noOFconsultations"] as? Int ?? 0
                let description          = dataDic["description"] as? String ?? ""
                let major                = dataDic["major"] as? String ?? ""
                let price                = dataDic["price"] as? Int ?? 0
                let minutes              = dataDic["minutes"] as? Int ?? 0
                let email                = dataDic["email"] as? String ?? ""
                let favoriteIds          = dataDic["faviorte"] as? [String] ?? []
                let isConsultant         = dataDic["isConsultant"] as? Bool ?? false
                let phoneNumber          = dataDic["phoneNumber"] as? String ?? ""
                let documents            = dataDic["documents"] as? [String] ?? []
                let user = User(id: id, ImageURL: ImageURL, imageVideoName: imageVideoName, name: name,
                                rating: rating, noOFconsultations: noOFconsultations, description: description, major: major, price: price, minutes: minutes,
                                favoriteIds: favoriteIds, isConsultant: isConsultant, phoneNumber: phoneNumber, documents: documents, email: email)
                print("DEBUG: fetching consultants ... \(user)")
                self.consultants.append(user)
            }
        }
    }
    
    func logUserIn(email: String, password: String, completion: @escaping( (Bool) -> () )) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error while creating new user \(error.localizedDescription)")
                completion(false)
            }
            completion(true)
        }
    }
    
    
    
    func logOut(completion: @escaping( (Bool) -> () )) {
        do {
            try Auth.auth().signOut()
            completion(true)
        } catch {
            print("Error while logging user out")
            completion(false)
        }
    }
    
    func addToFavorites(consultant: User, completion: @escaping( (Bool) -> () )) {
        guard let userId = auth.currentUser?.uid else {return}
        let data = ["id" : consultant.id] as [String : Any]
        firestore.collection("users").document(userId).collection("favorites").document(consultant.id).setData(data)
    }
    
    func fetchCurrentUser() {
        guard let userId = auth.currentUser?.uid else {return}
        print("DEBUG:: user id \(userId)")
        if isConsultant {
            firestore.collection("consultants").document(userId).getDocument { documentSnapshot, error in
                if let error = error {
                    print("Error while fetching current account for consultants \(error.localizedDescription)")
                }
                guard let dataDic = documentSnapshot?.data() else {return}
                self.currentUser.id                      = dataDic["id"] as? String ?? ""
                self.currentUser.ImageURL                = dataDic["ImageURL"] as? String ?? ""
                self.currentUser.imageVideoName          = dataDic["imageVideoName"] as? String ?? ""
                self.currentUser.name                    = dataDic["name"] as? String ?? ""
                self.currentUser.rating                  = dataDic["rating"] as? Double ?? 0.0
                self.currentUser.noOFconsultations       = dataDic["noOFconsultations"] as? Int ?? 0
                self.currentUser.description             = dataDic["description"] as? String ?? ""
                self.currentUser.major                   = dataDic["major"] as? String ?? ""
                self.currentUser.price                   = dataDic["price"] as? Int ?? 0
                self.currentUser.email                   = dataDic["email"] as? String ?? ""
                self.currentUser.minutes                 = dataDic["minutes"] as? Int ?? 0
                self.currentUser.favoriteIds             = dataDic["favoriteIds"] as? [String] ?? []
                self.currentUser.isConsultant            = dataDic["isConsultant"] as? Bool ?? false
                self.currentUser.isAccountActive         = dataDic["isAccountActive"] as? Bool ?? false
                self.currentUser.phoneNumber             = dataDic["phoneNumber"] as? String ?? ""
                self.currentUser.documents               = dataDic["documents"] as? [String] ?? []
                print("DEBUG: successfully fetched user data \(self.currentUser)")
            }
        } else {
            firestore.collection("users").document(userId).getDocument { documentSnapshot, error in
                if let error = error {
                    print("Error while fetching current account for consultants \(error.localizedDescription)")
                }
                guard let dataDic = documentSnapshot?.data() else {return}
                self.currentUser.id                   = dataDic["id"] as? String ?? ""
                self.currentUser.ImageURL             = dataDic["ImageURL"] as? String ?? ""
                self.currentUser.imageVideoName       = dataDic["imageVideoName"] as? String ?? ""
                self.currentUser.name                 = dataDic["name"] as? String ?? ""
                self.currentUser.rating               = dataDic["rating"] as? Double ?? 0.0
                self.currentUser.noOFconsultations    = dataDic["noOFconsultations"] as? Int ?? 0
                self.currentUser.description          = dataDic["description"] as? String ?? ""
                self.currentUser.major                = dataDic["major"] as? String ?? ""
                self.currentUser.price                = dataDic["price"] as? Int ?? 0
                self.currentUser.minutes              = dataDic["minutes"] as? Int ?? 0
                self.currentUser.favoriteIds          = dataDic["favoriteIds"] as? [String] ?? []
                self.currentUser.isConsultant         = dataDic["isConsultant"] as? Bool ?? false
                self.currentUser.isAccountActive         = dataDic["isAccountActive"] as? Bool ?? false
                self.currentUser.phoneNumber          = dataDic["phoneNumber"] as? String ?? ""
                self.currentUser.documents            = dataDic["documents"] as? [String] ?? []
                print("DEBUG: successfully fetched user data \(self.currentUser)")
            }
        }
        
        
    }
    
    func updateProfileImage(userId: String, profileImage: UIImage?, completion: @escaping( (Bool) -> () )) {
        uploadProfileImageToStorage(userId: userId, profileImage: profileImage) { imageUrl in
            self.currentUser.ImageURL = imageUrl
            try? self.firestore.collection("consultants").document(userId).setData(from: self.currentUser, merge: true)
            if self.isConsultant {
                try? self.firestore.collection("consultants").document(userId).setData(from: self.currentUser, merge: true)
            } else {
                try? self.firestore.collection("users").document(userId).setData(from: self.currentUser, merge: true)
            }
        }
    }
    func deleteDocument(){
        try? firestore.collection("consultants").document(currentUser.id).setData(from: self.currentUser, merge: true)
    }
    
    func uploadFilesToStorage(fileUrlStrings: [URL]){
        guard let userId = auth.currentUser?.uid else {return}
        for fileUrl in fileUrlStrings {
            let fileName: String = UUID().uuidString
            let ref = storage.reference(withPath: userId + "/" + fileName + "/" + fileUrl.lastPathComponent)
            ref.putFile(from: fileUrl) { storageMetadata, error in
                if let error = error {
                    print("DEBUG: error while uploading image \(error)")
                    return
                }
                ref.downloadURL { imageUrl, error in
                    if let error = error {
                        print("DEBUG: error while uploading image \(error)")
                        return
                    }
                    guard let fileUtrString = imageUrl?.absoluteString else {return}
                    print("DEBUG: Successfully uploaded profile \(fileUtrString)")
                    self.currentUser.documents.append(fileUtrString)
                    if self.isConsultant{
                        try? self.firestore.collection("consultants").document(userId).setData(from: self.currentUser)
                    } else {
                        try? self.firestore.collection("consultants").document(userId).setData(from: self.currentUser)
                    }
                }
            }
        }
    }
    
    func uploadProfileImageToStorage(userId: String, profileImage: UIImage? , completion: @escaping ((String) -> ())){
        let profileImageId = UUID().uuidString
        if let profileImage = profileImage {
            guard let imageData = profileImage.jpegData(compressionQuality: 0.5) else {return}
            let ref = storage.reference(withPath: userId + "/" + profileImageId)
            ref.putData(imageData, metadata: nil) { storageMetadata, error in
                if let error = error {
                    print("DEBUG: error while uploading image \(error)")
                    return
                }
                ref.downloadURL { imageUrl, error in
                    if let error = error {
                        print("DEBUG: error while uploading image \(error)")
                        return
                    }
                    guard let profileImageUrl = imageUrl?.absoluteString else {return}
                    print("DEBUG: Successfully uploaded profile")
                    completion(profileImageUrl)
                }
            }
        }
    }
    
    func updateCurrentName(name: String, completion: @escaping( (Bool) -> () )) {
        let data = [
            "id" : self.currentUser.id,
            "ImageURL" : self.currentUser.ImageURL,
            "imageVideoName" : self.currentUser.imageVideoName,
            "name" : self.currentUser.name,
            "rating" : self.currentUser.rating,
            "noOFconsultations" : self.currentUser.noOFconsultations,
            "description" : self.currentUser.description,
            "major" : self.currentUser.major,
            "price" : self.currentUser.price,
            "email": self.currentUser.email,
            "minutes" : self.currentUser.minutes,
            "faviorte" : self.currentUser.favoriteIds,
            "isConsultant" : self.currentUser.isConsultant,
            "phoneNumber" : self.currentUser.phoneNumber,
            "documents" : self.currentUser.documents,] as [String : Any]
        firestore.collection("consultants").document(self.currentUser.id).setData(data, merge: true)
        completion(true)
    }
    
    func updateEmail(email: String, completion: @escaping( (Bool) -> () )) {
        auth.currentUser?.updateEmail(to: email, completion: { error in
            if let error = error {
                print("Error while updating email \(error.localizedDescription)")
                completion(false)
            }
            
            let data = [
                "id" : self.currentUser.id,
                "ImageURL" : self.currentUser.ImageURL,
                "imageVideoName" : self.currentUser.imageVideoName,
                "name" : self.currentUser.name,
                "rating" : self.currentUser.rating,
                "noOFconsultations" : self.currentUser.noOFconsultations,
                "description" : self.currentUser.description,
                "major" : self.currentUser.major,
                "price" : self.currentUser.price,
                "minutes" : self.currentUser.minutes,
                "faviorte" : self.currentUser.favoriteIds,
                "email": self.currentUser.email,
                "isConsultant" : self.currentUser.isConsultant,
                "phoneNumber" : self.currentUser.phoneNumber,
                "documents" : self.currentUser.documents,] as [String : Any]
            
            if self.isConsultant{
                self.firestore.collection("consultants").document(self.currentUser.id).setData(data, merge: true)
                completion(true)
            } else {
                self.firestore.collection("users").document(self.currentUser.id).setData(data, merge: true)
                completion(true)
            }
            
        })
    }
    
    func createUser(email: String, password: String , completion: @escaping( (Bool) -> () )) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error while creating new user \(error.localizedDescription)")
                completion(false)
            }
            
            guard let authResult = authResult else {return}
            let userId = authResult.user.uid
            var user = User(id: userId, ImageURL: "", imageVideoName: "", name: "", rating: 0.0,
                            noOFconsultations: 0, description: "", major: "", price: 0,
                            minutes: 0, favoriteIds: [], isConsultant: self.isConsultant,
                            phoneNumber: "", documents: [], email: email)
            if self.isConsultant {
                user.isAccountActive = false
                try? self.firestore.collection("consultants").document(userId).setData(from: user)
            } else {
                user.isAccountActive = true
                try? self.firestore.collection("users").document(userId).setData(from: user)
            }
            completion(true)
        }
    }
    
}
