//
//  User.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 28/10/24.
//

import FirebaseFirestore
import Firebase
import FirebaseAuth

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == id
    }
}
