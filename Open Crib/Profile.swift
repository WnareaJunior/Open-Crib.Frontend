//
//  Profile.swift
//  Open Crib
//
//  Created by oscar alvarez on 9/19/22.
//

import Foundation
import SwiftUI

struct Profile: View {
    var body: some View {
        ZStack{
            Color.cribGray
                .ignoresSafeArea()
            Text("Profile")
                .foregroundColor(Color.white)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
