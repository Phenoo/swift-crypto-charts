//
//  Home.swift
//  TradeCharts
//
//  Created by Eze Chidera Paschal on 18/08/2024.
//

import SwiftUI
import SDWebImageSwiftUI

enum CurrencySelect: String, Codable, CaseIterable {
    case BTC = "btc"
    case ETH = "eth"
    case BNB = "bnb"
    case USDT = "usdt"
    case SOL = "sol"
}

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(insertion: .move(edge: .trailing).combined(with: .opacity), removal: .scale.combined(with: .opacity))
    }
}

struct Home: View {
    @EnvironmentObject private var model: CryptoData

    @State private var selectedCurrency: CurrencySelect  = .BTC
    
    @State private var selectedData: CryptoModel? = CryptoModel(id: "2",
                                                                            symbol: "eth",
                                                                            name: "Ethereum",
                                                                            image: "https://cryptologos.cc/logos/ethereum-eth-logo.png",
                                                                            current_price: 1650.50,
                                                                            last_updated: "2024-08-18T12:00:00Z",
                                                                            price_change: -0.75, // -0.75% price change
                                                                            last_7days_price: GraphModel(
                                                                                price: [
                                                                                    61011.134834720804,61100.641864870006,61139.79916109989,61021.307089617876,61100.31910266797,60966.178059690064,61056.25916994057,61141.70428796424,61279.09089914344,61272.181426460964,61198.89822854139,61117.89664074487,60707.95399897831,60313.6607485688,60364.759981356496,60332.94765609406,60037.409793395156,60181.83158786765,60224.756927116745,60080.736165909206,58934.90926747568,58371.55454267009,58769.693922188424,58844.58510274143,58804.23449992608,58661.41383715496,58608.72435938079,58554.46081213625,58431.11518125146,58600.66576891849,58437.06364064398,58448.86585917062,58812.20051163998,58303.406724980516,58223.513740514,59372.15000462517,59714.60252234014,59768.523472827816,59177.9964628881,60140.893484773536,59701.57143830804,59808.77022585978,59244.19489833363,59043.951298881395,59252.87617331191,58733.30616009725,59160.940626575415,59193.79443709478,59487.84718712906,59616.15061031841,59645.69569462356,59196.59489093399,58948.845278903515,59206.26829520003,59210.93641438889,59392.98070471743,59326.83192545242,58867.89565221312,58968.03485419861,58726.82476342119,58802.04160747715,59066.919311197,59374.14959473762,59639.09853912866,59982.698175257654,61213.260164439576,61213.05752654258,60586.49440610235,60700.017313229466,60634.62198998188,60930.70826903593,60520.521585843,60611.1178437017,60754.85111728312,60680.99542837812,60974.5246749954,60934.71745277854,61018.6692167453,60892.081560238315,60780.9965478888,60932.51558979862,60905.02264032649,61116.85624966809,60948.01211615021,61356.318193391344,60741.11900146548,58989.47034890381,59296.870497296506,59398.18261345918,59247.72206319977,59232.393107718366,58938.9576899662,58992.182451813904,59117.49227477686,58607.84280247439,58989.62219097791,58819.599962208355,58872.61696669897,58275.85931603416,58445.4062844714,58370.951501063326,58313.335500366025,58264.40579045636,58088.79404612981,58051.71502223428,58432.21244049253,58413.67017961424,58485.15425804929,58729.1333863503,58870.26610323387,59483.03961230005,59345.565722265164,59727.942107983596,59401.453819783936,58148.51663284134,57182.5690515019,57182.19956170608,56765.926472158855,57588.13281893597,57590.117286304856,57517.288261417954,57388.406266252496,57463.08029840291,58110.020444975285,57953.45268300431,58206.631385308734,58299.972387030146,58481.39741510699,58601.31105458154,58349.97587789022,58393.5913309717,58394.022290466,58479.15548513328,58107.39617493354,58322.02070299983,58087.23647718457,58366.058274183546,58602.833023575986,59336.92183147019,59546.701473360816,59658.822844689734,59257.78670650454,59079.85864539329,59008.35598447069,58860.57334808443,59217.47771557815,59350.615234769495,59152.62830970626,59169.67657788981,59217.21091899589,59199.61103327122,59102.25419430356,59281.64422691288,59281.08059915197,59339.07971026275,59144.78963688992,59137.83368710243,59235.06313556112,59433.059003423536,59445.46121861815,59498.10996225166,59650.14463574034,59460.11857230874,59428.52852368441,59484.96679706533,59406.83982049235,59288.15508034803,59408.23428651597
                                                                                ]
                                                                            ))
    
   
    
    
    let currency: [String] = ["BTC", "ETH", "BNB"]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                AnimatedImage(url: URL(string: selectedData?.image ?? "https://cryptologos.cc/logos/ethereum-eth-logo.png"))
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                   

             
                VStack(alignment: .leading) {
                    Text(selectedData?.name ?? "")
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(selectedData?.symbol.uppercased() ?? "")
                        .font(.subheadline)
                        .opacity(0.5)
                    
                }
                Spacer()
            }
            
            Picker("Currency", selection: $selectedCurrency) {
                ForEach(CurrencySelect.allCases, id: \.self) { curr in
                    Text(curr.rawValue.uppercased())
                      
                }
                
            }
            .pickerStyle(.segmented)
            .onChange(of: selectedCurrency, {
                withAnimation(.easeInOut(duration: 0.5)) {
                    selectedData =
                       model.cryptodata.first {  $0.symbol == selectedCurrency.rawValue}                              }
                
                
                
            })
           
            if let selectedData = selectedData {
                GraphView(data: selectedData)
                    .transition(.slide)
            }
            

            
            
            
            HStack(spacing: 20) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Sell")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.black)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(.vertical)
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .fill(.white)
                        }
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Buy")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.black)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .padding(.vertical)
                        .background {
                            RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .fill(.green)
                        }
                })
            }
        }
        .onAppear{
            selectedCurrency = .BTC
        }
        .padding()
    }
}

#Preview {
    Home().environmentObject(CryptoData(webservice: WebService()))
}
