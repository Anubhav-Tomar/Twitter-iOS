//
//  UploadTweetVM.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 29/10/24.
//

import Foundation

class UploadTweetVM: ObservableObject {
    
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(withCaption caption: String) {
        service.uploadTweet(caption: caption) { success in
            if success {
                // dismiss screen
                self.didUploadTweet = true
            }   else {
                
            }
        }
    }
}
