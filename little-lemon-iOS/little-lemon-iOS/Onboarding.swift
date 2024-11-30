//
//  Onboarding.swift
//  little-lemon-iOS
//
//  Created by Jose Rojas on 26/11/24.
//

import SwiftUI

let firstNameKey = "firstName"
let lastNameKey = "lastName"
let emailKey = "email"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var email: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                 NavigationLink(destination: Home(), isActive: $isLoggedIn) {
                    EmptyView()
                }
                // Welcome Header
                VStack(spacing: 8) {
                    Text("Welcome to Little Lemon")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("Please fill out the form below to register and start your journey!")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
                .padding(.bottom, 30)
                
                // Input Fields
                VStack(spacing: 16) {
                    TextField("First Name", text: $firstName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .shadow(radius: 1)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .keyboardType(.emailAddress)
                        .shadow(radius: 1)
                }
                .padding(.horizontal)
                
                // Register Button
                Button(action: {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.set(firstName, forKey: firstNameKey)
                        UserDefaults.standard.set(lastName, forKey: lastNameKey)
                        UserDefaults.standard.set(email, forKey: emailKey)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    }
                }) {
                    Text("Register")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(firstName.isEmpty || lastName.isEmpty || email.isEmpty ? Color.gray : Color(.red))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 2)
                }
                .disabled(firstName.isEmpty || lastName.isEmpty || email.isEmpty)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Onboarding")
            .navigationBarTitleDisplayMode(.inline)
            .navigationViewStyle(StackNavigationViewStyle())
            .onAppear {
                isLoggedIn = UserDefaults.standard.bool(forKey: kIsLoggedIn)
            }
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $isLoggedIn) {
                Home()
            }
        }
    }
}
#Preview {
    Onboarding()
}
