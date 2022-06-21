//
//  FireBaseManager.swift
//  TakeTech
//
//  Created by Arwa Alzahrani on 22/11/1443 AH.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class FireBaseManager: ObservableObject {
    
    @Published var users : [User] = []
    
    func fetchUsers() {
        
        Firestore.firestore().collection("users").getDocuments { snapshot , error in
            guard let users = snapshot?.documents.compactMap({ queryDocumentSnapshot in
                try? queryDocumentSnapshot.data(as: User.self)
            }) else {return}
            
            self.users = users
            
        }
        
        
        
    }
    
}
