//
//  ContentView.swift
//  TradeCharts
//
//  Created by Eze Chidera Paschal on 18/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject private var model: CryptoData
    
    private func populateDataClient() async {
        do {
            try await model.populateData()
            print("done")
        } catch {
            print("error")
        }
    }
    
    var body: some View {
        VStack{
        
            Home()
            
        }
            .task {
                await populateDataClient()
            }
            .onAppear {
                print(model.$cryptodata)
            }
            .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView().environmentObject(CryptoData(webservice: WebService()))
}
