//
//  APIClient.swift
//  testing-opencrib
//
//  Created by Wilson Narea on 11/25/22.
//

import Foundation
import SwiftUI
import FirebaseAuth


class APIClient{
    
    let baseUrl = URL(string: "https://opencribdevapi.azurewebsites.net/api/")
    
    init(){
        
    }
   
    
    static func fetchUserInfo(username: String)async throws->UserModel{
        let url = URL(string: " https://opencribdevapi.azurewebsites.net/api/User/GetUser/" + username)!
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw UserError.itemNotFound
        }
        let jsonDecoder = JSONDecoder()
        let UserInfo = try jsonDecoder.decode(UserModel.self, from: data)
        
        return (UserInfo)
        
    }
   
    
    
    static func fetchPartyInfo() async throws -> [PartyModel]{
            let url = URL(string: "https://opencribdevapi.azurewebsites.net/api/Party/GetPartiesNearby/33019/200")!
            
            let (data,response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw PartyError.itemNotFound
            }
            let jsonDecoder = JSONDecoder()
            let partyInfo = try jsonDecoder.decode([PartyModel].self, from: data)
            
            return (partyInfo)
            
        }
    func postParty(partyInfo: PartyModel) async throws {
        let partyUrl = baseUrl
        

    }
    

    
}

enum PartyError: Error, LocalizedError {
    case itemNotFound
}
enum UserError: Error, LocalizedError {
    case itemNotFound
}
