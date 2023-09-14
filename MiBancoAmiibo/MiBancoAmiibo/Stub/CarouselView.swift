//
//  CarouselView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 13/09/23.
//

import SwiftUI

struct CarouselView: View {
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    CardView(dishName: "H", dishImage: "Haruka_ofa_casual")
                    CardView(dishName: "C", dishImage: "Chihaya_ofa_casual")
                    CardView(dishName: "Y", dishImage: "Yukiho_ofa_casual")
                    CardView(dishName: "H", dishImage: "Haruka_ofa_casual")
                    CardView(dishName: "C", dishImage: "Chihaya_ofa_casual")
                    CardView(dishName: "Y", dishImage: "Yukiho_ofa_casual")
                    CardView(dishName: "H", dishImage: "Haruka_ofa_casual")
                }
            }
        }
        HStack {
            Button {
                //                        viewModel.darAmiibo()
            } label: {
                Text("CONSULTAR")
            }
            Button {
                //                        viewModel.darAmiibo()
            } label: {
                Text("LIMPIAR")
            }
        }
    }
}

struct CardView: View {
    let dishName: String
    let dishImage: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .green]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 78, height: 160, alignment: .center)
            VStack {
                Image("\(dishImage)").resizable().frame(width: 78, height: 160, alignment: .top)
            }
        }
    }
}
