//
//  TweetFilterVM.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 24/10/24.
//

import Foundation

enum TweetFilterVM: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
