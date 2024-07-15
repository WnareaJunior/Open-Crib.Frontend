//
//  SupraView.swift
//  Open Crib
//
//  Created by oscar alvarez on 9/19/22.
//

import Foundation
import SwiftUI

struct SupraView: View {
    @State var SwipeThruViews: CGFloat = UIScreen.main.bounds.minX
    let apiClient: APIClient
    
  
    
    var body: some View {
        MasterHomePageView(currentDragOffset: $SwipeThruViews)
            .offset(x:self.SwipeThruViews)
    }
}

//struct SupraView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            SupraView(apiClient: apiClient)
//        }
//    }
//}
