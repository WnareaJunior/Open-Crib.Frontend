//
//  Party.swift
//  Open Crib
//
//  Created by Wilson Narea on 5/20/22.
//

import Foundation
import UIKit
import CoreLocation

class Party{
    private var location: CLLocation
    private var date: Date
    private var host: User
    //private var partySettings: partySettings
    
    init(location:CLLocation,date:Date,host:User) {
        self.location = location
        self.date = date
        self.host = host
        //add party settings to init
    }
}

