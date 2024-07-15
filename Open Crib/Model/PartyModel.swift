//
//  PartyModel.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/9/22.
//

import Foundation

struct PartyModel: Codable{
    var id: String?
    var hostId: String?
    var comments: [commentModel]?
    var hostUsername: String
    var partyName: String
    var date: String
    var rsvps: [String]
    var views: Int
    var tags: [String]
    var address: AddressModel
    
}
