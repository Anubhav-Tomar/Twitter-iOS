//
//  TweetRowView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 12/10/24.
//

import SwiftUI
import Kingfisher

struct TweetRowView: View {
    
    @ObservedObject var viewModel: TweetRowVM
    
    init(tweet: Tweet) {
        self.viewModel = TweetRowVM(tweet: tweet)
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            // Profile image + user info + tweet
            if let user = viewModel.tweet.user {
                HStack (alignment: .top, spacing: 12) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(Circle())
                    
                    // User info & tweet caption
                    VStack (alignment: .leading, spacing: 4) {
                        // User info
                        
                        HStack {
                            Text(user.fullname)
                                .font(.subheadline)
                                .bold()
                            
                            Text("@\(user.username)")
                                .foregroundStyle(.gray)
                                .font(.caption)
                            
                            Text("")
                                .foregroundStyle(.gray)
                                .font(.caption)
                        }
                        
                        //Tweet Caption
                        Text(viewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
            }
            
            // Action buttons
            
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button {
                    viewModel.tweet.didLike ?? false ?
                    viewModel.unlikeTweet() :
                    viewModel.likeTweet()
                } label: {
                    Image(systemName: viewModel.tweet.didLike ?? false ? "heart.fill" : "heart")
                        .font(.subheadline)
                        .foregroundStyle(viewModel.tweet.didLike ?? false ? .red : .gray)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
            .foregroundStyle(.gray)
            
            Divider()
        }
        .padding()
    }
}
