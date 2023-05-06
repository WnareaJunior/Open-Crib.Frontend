//
//  UserModel.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/18/22.
//

import Foundation

struct UserModel:Codable{
    var partiesAttended: [String]
    var partiesThrown: [String]
    var username: String
    var password: String
    var DOB: Date
    var followers: Int
    var following: Int
    var rank: Int
}
