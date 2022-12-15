//
//  APIClient.swift
//  Open Crib
//
//  Created by Wilson Narea on 12/2/22.
//

import Foundation

class APIClient{
    let baseURL = "http://ip.jsontest.com/"
    
    static let shared = APIClient()
    
    private init(){
        
        
        func getData(completion: @escaping ([PartyModel]) -> Void) {
            guard let url = URL(string: baseURL) else {
                completion([])
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion([])
                    print(error.localizedDescription)
                    return
                }
                
                guard let data = data else {
                    completion([])
                    return
                }
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                guard let partyItems = try? decoder.decode([PartyModel].self, from: data) else {
                    completion([])
                    print("could not decode data")
                    return
                }
                completion(partyItems)
            }.resume()
        
        }
        
        
        
    }
}

