//
//  ExploreView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 12/10/24.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject var viewModel = ExploreVM()
    
    var body: some View {
        VStack {
            
            SearchBar(text: $viewModel.searchText)
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchAbleUsers) { user in
                        NavigationLink {
                                ProfileView(user: user)
                        }   label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)}
    }
}
