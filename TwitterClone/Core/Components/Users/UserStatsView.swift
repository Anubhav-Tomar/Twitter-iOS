//
//  UserStatsView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 26/10/24.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack (spacing: 24) {
            HStack (spacing: 4) {
                Text("887")
                    .font(.subheadline)
                    .bold()
                
                Text("Following")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            HStack (spacing: 4) {
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                
                Text("Followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    UserStatsView()
}
