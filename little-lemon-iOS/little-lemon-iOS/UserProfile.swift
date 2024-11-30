//
//  UserProfile.swift
//  little-lemon-iOS
//
//  Created by Jose Rojas on 27/11/24.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack(spacing: 20) {
            // Header
            VStack(spacing: 8) {
                Text("Personal Information")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                
                Image("profile-placeholder")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.red, lineWidth: 3))
                    .shadow(radius: 5)
            }
            .padding(.bottom, 20)
            
            // User Information
            VStack(spacing: 15) {
                InfoRow(label: "Email", value: UserDefaults.standard.string(forKey: emailKey) ?? "Not available")
                InfoRow(label: "First Name", value: UserDefaults.standard.string(forKey: firstNameKey) ?? "Not available")
                InfoRow(label: "Last Name", value: UserDefaults.standard.string(forKey: lastNameKey) ?? "Not available")
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding(.horizontal)
            
            Spacer()
            
            // Logout Button
            Button(action: {
                UserDefaults.standard.set("", forKey: firstNameKey)
                UserDefaults.standard.set("", forKey: lastNameKey)
                UserDefaults.standard.set("", forKey: emailKey)
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Logout")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 2)
            }
            .padding(.horizontal)
        }
        .padding()
        .background(Color(.systemGroupedBackground))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct InfoRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label + ":")
                .fontWeight(.semibold)
                .foregroundColor(.secondary)
            Spacer()
            Text(value)
                .foregroundColor(.primary)
        }
    }
}

#Preview {
    UserProfile()
}
