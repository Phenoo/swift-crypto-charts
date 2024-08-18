//
//  CryptoData.swift
//  TradeCharts
//
//  Created by Eze Chidera Paschal on 18/08/2024.
//

import Foundation



@MainActor

class CryptoData: ObservableObject {
    
    let webservice: WebService
    
    init(webservice: WebService) {
        self.webservice = webservice
    }
    
    @Published private(set) var cryptodata: [CryptoModel] = []
    
    
    func populateData() async throws {
        cryptodata = try await webservice.getData()
    }
    
}
