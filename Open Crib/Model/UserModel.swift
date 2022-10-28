//
//  UserModel.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/18/22.
//

import Foundation

struct UserModel:Codable{
    var partiesAttended: Int
    var partiesHosted: Int
    var username: String
    var password: String
    var DOB: Date
}
