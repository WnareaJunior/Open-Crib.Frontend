//
//  HostingTab.swift
//  Open Crib
//
//  Created by oscar alvarez on 1/30/23.
//

import Foundation
import SwiftUI

struct HostingTab: View {
    var body: some View{
        Path { path in
            path.move(to: CGPoint(x: 3, y: 120))
            path.addLine(to: CGPoint(x: 3, y: UIScreen.main.bounds.maxY-83))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.maxX-2, y: UIScreen.main.bounds.maxY-83))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.maxX-3, y: 150))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.midX, y: 150))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.maxX*0.3, y: 120))
            path.closeSubpath()
        }
        
        .fill(Color("cribCyan"))
        
        
    }
}

struct HostingTab_Previews: PreviewProvider {
    static var previews: some View {
        HostingTab()
    }
}
