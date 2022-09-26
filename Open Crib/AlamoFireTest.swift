//
//  AlamoFireTest.swift
//  Open Crib
//
//  Created by oscar alvarez on 7/19/22.
//

import Foundation
import Alamofire

class AlamoFireTest{
    func execute(_ url: String){
        AF.request(url).response{ response in
            debugPrint(response)
        }
    }
}
