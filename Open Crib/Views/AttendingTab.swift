//
//  AttendingTab.swift
//  Open Crib
//
//  Created by oscar alvarez on 1/30/23.
//

import Foundation
import SwiftUI

struct AttendingTab: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 3, y: 150))
            path.addLine(to: CGPoint(x: 3, y: UIScreen.main.bounds.maxY-83))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.maxX-2, y: UIScreen.main.bounds.maxY-83))
            
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.maxX-3, y: 150))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.maxX-30, y: 150))
            path.addQuadCurve(to: CGPoint(x: UIScreen.main.bounds.midX, y: 120), control: CGPoint(x: 300, y: 120))
            path.addLine(to: CGPoint(x: UIScreen.main.bounds.midX, y: 150))
            
            
        }.fill(.white)
        
    }
}

struct AttendingTab_Previews: PreviewProvider {
    static var previews: some View {
        AttendingTab()
    }
}
