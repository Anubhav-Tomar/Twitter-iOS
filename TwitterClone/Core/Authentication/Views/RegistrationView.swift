//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 27/10/24.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var fullname: String = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthVM
    
    var body: some View {
        NavigationStack {
            VStack {
                
                AuthHeaderView(title1: "Get started.", title2: "Create your account ")
                
                VStack(spacing: 40) {
                    CustomInputField(imageName: "envelope",
                                     placeholderText: "Email",
                                     text: $email)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    
                    CustomInputField(imageName: "person",
                                     placeholderText: "Username",
                                     text: $username)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    
                    CustomInputField(imageName: "person",
                                     placeholderText: "Full name",
                                     text: $fullname)
                    
                    CustomInputField(imageName: "lock",
                                     placeholderText: "Password",
                                     isSecureField: true,
                                     text: $password)
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                }
                .padding(32)
                
                //Sign up button
                Button {
                    viewModel.register(withEmil: email,
                                       username: username,
                                       fullname: fullname,
                                       password: password)
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.footnote)
                        
                        Text("Sign In")
                            .font(.caption)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.bottom, 32)
            
            }
            .navigationDestination(isPresented: $viewModel.didAuthenticateUser) {
                            ProfilePhotoSelectorView()
                        }
                        .ignoresSafeArea()
                        .navigationBarHidden(true)
        }
    }
}

#Preview {
    RegistrationView()
}
