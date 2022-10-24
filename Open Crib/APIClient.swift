//
//  APIClient.swift
//  Open Crib
//
//  Created by oscar alvarez on 8/9/22.
//

import Foundation

class APIClient {
    
    let baseURL = "https://opencribapi20225.azurewebsites.net/api/Party/GetPartiesNearby/"
    
    static let shared = APIClient()
    
    private init(){
    }
    
    func getData(completion: @escaping ([PartyModel]) -> Void) {
    
        guard let url = URL(string: "https://opencribapi20220716052945.azurewebsites.net/api/Party/GetPartiesNearby/33178/200") else {
            return
        }
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
        
            guard let partyItems = try? decoder.decode([PartyModel].self, from: data) else{
                print("could not decode")
                return
            }
            completion(partyItems)
        }.resume()
    }
    
//    func receiveData(completion: @escaping ([PartyModel]) -> Void){
//        guard let url = URL(string: "https://opencribapi20220716052945.azurewebsites.net/api/Party/GetPartiesNearby/33178/200") else {
//            return
//        }
//    
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error.localizedDescription)
//                return
//            }
//            guard let data = data else {
//                return
//            }
//            let encoder = JSONEncoder()
//            encoder.dateEncodingStrategy = .iso8601
//        
//            guard let partyItems = try? encoder.encode([PartyModel].self) else{
//                print("could not encode")
//                return
//            }
//            completion(partyItems)
//        }.resume()
//    }
}
