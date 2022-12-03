//
//  APIClient.swift
//  testing-opencrib
//
//  Created by Wilson Narea on 11/25/22.
//

import Foundation
import SwiftUI


class APIClient{
    
    init(){
        
    }
    
    
    func fetchPartyInfo() async throws -> [PartyModel]{
            let url = URL(string: "https://opencribdevapi.azurewebsites.net/api/Party/GetPartiesNearby/33019/0")!
            
            let (data,response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw PartyError.itemNotFound
            }
            let jsonDecoder = JSONDecoder()
            let partyInfo = try jsonDecoder.decode([PartyModel].self, from: data)
            
            return (partyInfo)
            
        }

    
}

enum PartyError: Error, LocalizedError {
    case itemNotFound
}
