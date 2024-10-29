//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 28/10/24.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthVM
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup account",
                           title2: "Add a profile photo")
            
            // pick image
            Button{
                showImagePicker.toggle()
            }   label: {
                if let profileImage = profileImage {
                    profileImage
                        .resizable()
                        .foregroundStyle(Color(.systemBlue))
                        .scaledToFill()
                        .frame(width: 180, height: 180)
//                        .padding(.top, 44)
                        .clipShape(Circle())
                }   else {
                    Image(systemName: "square.and.arrow.up.circle.fill")
                        .resizable()
                        .frame(width: 180, height: 180)
//                        .padding(.top, 44)
                }
            }
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
                   .padding(.top, 44)
            
            // continue button
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        profileImage = Image(uiImage: selectedImage)
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
