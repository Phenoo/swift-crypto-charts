//
//  WebService.swift
//  TradeCharts
//
//  Created by Eze Chidera Paschal on 18/08/2024.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
    case badUrl
}

class WebService {
    func getData()  async throws -> [CryptoModel] {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&sparkline=true&price_change_percentage=24h") else {
            throw NetworkError.badUrl
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badRequest
        }
        
        guard let cryptoData = try? JSONDecoder().decode([CryptoModel].self, from: data)  else {
            throw NetworkError.decodingError
        }
        
        return cryptoData
    }
}
