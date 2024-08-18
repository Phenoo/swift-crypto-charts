//
//  TradeChartsApp.swift
//  TradeCharts
//
//  Created by Eze Chidera Paschal on 18/08/2024.
//

import SwiftUI

@main
struct TradeChartsApp: App {
    
 
    @StateObject private var model: CryptoData
    
    init() {
        let webservice = WebService()
        
        _model = StateObject(wrappedValue: CryptoData(webservice: webservice))
    }
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(model)
        }
    }
}
