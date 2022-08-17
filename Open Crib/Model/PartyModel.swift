//
//  PartyModel.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/9/22.
//

import Foundation

struct PartyModel: Codable{
    var address: AddressModel
    var comments: String?
    var hostId: String
    var hostUsername: String
    var id: String
    var partyName: String
    var date: Date
    var rsvps: [String]
    var views: Int
    var tags: [String]
    
}
