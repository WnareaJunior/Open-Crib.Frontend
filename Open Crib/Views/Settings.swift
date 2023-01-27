//
//  Settings.swift
//  Open Crib
//
//  Created by Wilson Narea on 1/27/23.
//

import Foundation
import SwiftUI

struct Settings: View {
    @State var itsOn = true
    var body: some View {
        
        List{
            Text("who")
            Toggle("Private Account", isOn: $itsOn)
        }
    }
}



struct Settings_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            Settings()
        }
    }
}
