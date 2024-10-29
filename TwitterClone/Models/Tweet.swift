//
//  Tweet.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 29/10/24.
//

import FirebaseFirestore
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
    var didLike: Bool? = false
}
