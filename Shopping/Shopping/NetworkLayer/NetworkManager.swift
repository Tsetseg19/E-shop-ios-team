//
//  NetworkManager.swift
//  Shopping
//
//  Created by Bhuiyan Wasif on 2/12/25.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(urlPath: String, modelType: T.Type) async throws -> T
}

final class NetworkManager: NetworkManagerProtocol {
    func fetchData<T>(urlPath: String, modelType: T.Type) async throws -> T where T : Decodable {
        let bundle = Bundle(for: NetworkManager.self)
        let urlObj = bundle.url(forResource: urlPath, withExtension: "json")
        
        guard let urlObj else {
            throw NetworkError.invalidURL
        }
        do{
            let data = try Data(contentsOf: urlObj)
            let parsedData = try JSONDecoder().decode(modelType, from: data)
            return parsedData
        }catch{
            print("Error: \(error.localizedDescription)")
            throw error
        }
    }
}
