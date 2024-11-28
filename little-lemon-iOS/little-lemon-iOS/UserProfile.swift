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
        VStack {
            Text("Personal information")
            Image("profile-placeholder")
            Text(UserDefaults.standard.string(forKey: emailKey) ?? "")
            Text(UserDefaults.standard.string(forKey: firstNameKey) ?? "")
            Text(UserDefaults.standard.string(forKey: lastNameKey) ?? "")
            Button("Logout") {
                UserDefaults.standard.set("", forKey: firstNameKey)
                UserDefaults.standard.set("", forKey: lastNameKey)
                UserDefaults.standard.set("", forKey: emailKey)
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

#Preview {
    UserProfile()
}
