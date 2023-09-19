//
//  CarouselView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 13/09/23.
//

import SwiftUI

struct CarouselView: View {
    
    @ObservedObject var viewModel: StubViewModel
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CardView(cardName: "Haruka", cardImage: "Haruka_ofa_casual", cardSupply: .basics, viewModel: viewModel)
                    CardView(cardName: "Chihaya", cardImage: "Chihaya_ofa_casual", cardSupply: .offers, viewModel: viewModel)
                    CardView(cardName: "Yukiho", cardImage: "Yukiho_ofa_casual", cardSupply: .risk, viewModel: viewModel)
                    CardView(cardName: "Yayoi", cardImage: "Yayoi_ofa_casual", cardSupply: .history, viewModel: viewModel)
                    CardView(cardName: "Ritsuko", cardImage: "Ritsuko_ofa_casual", cardSupply: .fund, viewModel: viewModel)
                    CardView(cardName: "Azusa", cardImage: "Azusa_ofa_casual", cardSupply: .debt, viewModel: viewModel)
                    CardView(cardName: "Iori", cardImage: "Iori_ofa_casual", cardSupply: .contact, viewModel: viewModel)
                    CardView(cardName: "Makoto", cardImage: "Makoto_ofa_casual", cardSupply: .pqr, viewModel: viewModel)
                }
            }
        }
        HStack {
            Button {
                //                        viewModel.darAmiibo()
            } label: {
                Text("Consultar")
            }
            Button {
                //                        viewModel.darAmiibo()
            } label: {
                Text("Limpiar")
            }
        }
    }
}

struct CardView: View {
    let cardName: String
    let cardImage: String
    let cardSupply: Supply
    
    @ObservedObject var viewModel: StubViewModel
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .green]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 78, height: 160, alignment: .center)
            VStack {
                Button(action: {
                    viewModel.getClient(supply: cardSupply)
                }) {
                    Image("\(cardImage)").resizable().frame(width: 78, height: 160, alignment: .top)
                }
            }
        }
    }
}
