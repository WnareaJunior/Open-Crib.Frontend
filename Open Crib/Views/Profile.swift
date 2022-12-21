//
//  Profile.swift
//  Open Crib
//
//  Created by oscar alvarez on 9/19/22.
//

import Foundation
import SwiftUI
import FirebaseAuth

struct Profile: View {
    var body: some View {
        ZStack{
            Color.cribGray
                .ignoresSafeArea()
            Text("Profile")
                .foregroundColor(Color.white)
                .onTapGesture {
                    do {
                        try Auth.auth().signOut()
                    } catch let signOutError as NSError {
                      print("Error signing out: %@", signOutError)
                    }
                }
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
