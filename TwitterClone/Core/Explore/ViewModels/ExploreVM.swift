//
//  ExploreVM.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 28/10/24.
//

import Foundation

class ExploreVM: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    
    var searchAbleUsers: [User] {
        if searchText.isEmpty {
            return users
        }   else {
            let lowercasedQuery = searchText.lowercased()
            
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.contains(lowercasedQuery)
            })
        }
    }
    
    let service = UserService()
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        service.fetchUsers { users in
            self.users = users
        }
       
    }
}
