//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 25/10/24.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    
    @EnvironmentObject var authViewmodel: AuthVM
    
    var body: some View {
        
        if let user = authViewmodel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                
                ForEach(SideMenuVM.allCases, id: \.rawValue) { viewModel in
                    
                    if viewModel == .profile {
                        NavigationLink {
                            ProfileView(user: user)
                        }   label: {
                            SideMenuOptionRowView(viewModel: viewModel )
                        }
                    }   else if viewModel == .logout{
                        Button {
                            authViewmodel.signOut()
                        }   label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    }   else {
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    SideMenuView()
}
