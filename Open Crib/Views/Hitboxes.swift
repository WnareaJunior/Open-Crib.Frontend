//
//  Hitboxes.swift
//  Open Crib
//
//  Created by oscar alvarez on 9/20/22.
//

import Foundation
import SwiftUI

struct Hitboxes: View{
    var body: some View {
        HStack{
        Rectangle()
            .opacity(0.0)
            .frame(width: 50, height: UIScreen.main.bounds.maxY, alignment: .trailing)
            .position(x:26, y: 375)
        Rectangle()
            .opacity(0.0)
            .frame(width: 50, height: UIScreen.main.bounds.maxY, alignment: .leading)
            .position(x:165, y: 375)
        }
    }
}

struct Hitboxes_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            Hitboxes()
        }
    }
}
