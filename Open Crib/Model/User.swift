//
//  User.swift
//  Open Crib
//
//  Created by Wilson Narea on 5/20/22.
//

import Foundation
import UIKit

class User {
    
    private var partiesAttended = 0;
    private var partiesHosted = 0;
    private var username: String
    private var password: String
    private var DOB: Date
    
    init(username:String,password:String,DOB:Date) {
        self.username = username
        self.password = password
        self.DOB = DOB
    }
    
}
