//
//  AddressModel.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/9/22.
//

import Foundation

struct AddressModel: Codable{
    var addressLine1: String
    var addressLine2: String
    var city: String
    var postalCode: String
    var state: String
}
