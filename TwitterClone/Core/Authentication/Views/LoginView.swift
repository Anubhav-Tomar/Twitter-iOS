//
//  LoginView.swift
//  TwitterClone
//
//  Created by Anubhav Tomar on 27/10/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthVM
    
    
    var body: some View {
        
        // Parent container
        VStack {
            
            // Header view
            AuthHeaderView(title1: "Hello.", title2: "Welcome Back")
            
            // Textfield
            VStack(spacing: 40) {
                CustomInputField(imageName: "envelope",
                                 placeholderText: "Email",
                                 text: $email)
                .autocapitalization(.none)
                .autocorrectionDisabled()
                
                CustomInputField(imageName: "lock",
                                 placeholderText: "Password",
                                 isSecureField: true,
                                 text: $password)
                .autocapitalization(.none)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44)
            
            // Forgot Password
            HStack{
                Spacer()
                
                NavigationLink {
                    Text("Reset Password")
                }   label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                }
            }
            
            //Sign in button
            Button {
                viewModel.login(withEmil: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)

            
            Spacer()
            
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            }   label: {
                HStack {
                    Text("Don't have an account?")
                        .font(.footnote)
                    
                    Text("Sign Up")
                        .font(.caption)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundStyle(Color(.systemBlue))
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

#Preview {
    LoginView()
}
