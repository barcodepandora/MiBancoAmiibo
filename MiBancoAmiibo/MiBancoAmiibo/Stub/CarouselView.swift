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
                    CardView(cardName: "Datos básicos", cardImage: "MiBanco001", cardSupply: .basics, viewModel: viewModel)
                    CardView(cardName: "Ofertas y Alertas", cardImage: "MiBanco002", cardSupply: .offers, viewModel: viewModel)
                    CardView(cardName: "Centrales de Riesgo", cardImage: "MiBanco003", cardSupply: .risk, viewModel: viewModel)
                    CardView(cardName: "Historial Préstamos", cardImage: "MiBanco004", cardSupply: .history, viewModel: viewModel)
                    CardView(cardName: "Cupo Rotativo", cardImage: "MiBanco005", cardSupply: .fund, viewModel: viewModel)
                    CardView(cardName: "Pasivos", cardImage: "MiBanco006", cardSupply: .debt, viewModel: viewModel)
                    CardView(cardName: "Historial Contactos", cardImage: "MiBanco007", cardSupply: .contact, viewModel: viewModel)
                    CardView(cardName: "PQR", cardImage: "MiBanco008", cardSupply: .pqr, viewModel: viewModel)
                }
            }
        }
        HStack {
            Button {
                //                        viewModel.darAmiibo()
            } label: {
                Text("Consultar")
                    .onTapGesture {
                        viewModel.changeState(supply: .autocomplete)
                        viewModel.changeViewState()
                        viewModel.changeViewFlavor()
                    }
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
                .frame(width: 72, height: 72, alignment: .center)
            VStack {
                Button(action: {
                    viewModel.getClient(supply: cardSupply)
                }) {
                    Image("\(cardImage)").resizable().frame(width: 72, height: 86, alignment: .top)
                }
                Text(cardName)
            }
        }
    }
}
