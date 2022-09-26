//
//  UserViewModel.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/18/22.
//

import Foundation
import SwiftUI

final class UserViewModel:ObservableObject{
    var data: [User] = [
        User(username: "anderson", password: "hello"),
        User(username: "panderson", password: "hello"),
        User(username: "ganderson", password: "hello"),
        User(username: "landerson", password: "hello"),
        User(username: "manderson", password: "hello")
    ]
    
    @Published var filteredData = [User]()
    
    func search(with query: String){
        filteredData = query.isEmpty ? data : data.filter {$0.username.contains(query)}
    }
}
