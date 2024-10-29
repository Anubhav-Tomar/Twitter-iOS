//
//  SideMenuOptionRowView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 26/10/24.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    
    let viewModel: SideMenuVM
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundStyle(.gray)
            
            Text(viewModel.title)
                .foregroundStyle(.black)
                .font(.subheadline)
            
            Spacer()
        }
        .frame(height: 40)
        .padding(.horizontal)
    }

    }

