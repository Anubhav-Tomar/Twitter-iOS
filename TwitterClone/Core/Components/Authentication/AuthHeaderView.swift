//
//  AuthHeaderView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 27/10/24.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let title1: String
    let title2: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack{ Spacer() }
            
            Text(title1)
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text(title2)
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
        .padding(.leading)
        .frame(height: 260)
        .background(Color(.systemBlue))
        .foregroundStyle(.white)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

#Preview {
    AuthHeaderView(title1: "Hello", title2: "Welcome back")
}
