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
    func postPartyInfo(partyInfo: PartyModel) async throws {
        
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601

        do {
            
            let jsonData = try encoder.encode(partyInfo)
            
            let apiUrl = URL(string: "https://example.com/api/parties")!
            
            var request = URLRequest(url: apiUrl)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print("Status code: \(httpResponse.statusCode)")
                    
                }
            }
            
            task.resume()
        } catch {
            print("Error encoding Party object: \(error)")
        }
        print("postParty executed")

    }
    
}

enum PartyError: Error, LocalizedError {
    case itemNotFound
}
enum UserError: Error, LocalizedError {
    case itemNotFound
}
