//
//  RadioButtonView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 13/09/23.
//

import SwiftUI

struct RadioButtonView: View {
    
    @State private var selectedIdentify: IdentifyOption? = .dni
    @ObservedObject var viewModel = StubViewModel()
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("")) {
                    ForEach(APIGuestOption    .allCases, id: \.self) { guest in
                        RadioButtonAPIGuestRow(
                            guest: guest,
                            isSelected: viewModel.selectedAPIGuest == guest
                        )
                        .onTapGesture {
                            viewModel.selectedAPIGuest = guest
                        }
                    }
                }
                Section(header: Text("")) {
                    ForEach(IdentifyOption    .allCases, id: \.self) { identify in
                        RadioButtonRow(
                            identify: identify,
                            isSelected: selectedIdentify == identify
                        )
                        .onTapGesture {
                            selectedIdentify = identify
                        }
                    }
                }
            }
        }
    }
}

struct RadioButtonRow: View {
    let identify: IdentifyOption
    let isSelected: Bool

    var body: some View {
        HStack {
            Text(identify.rawValue)
            Spacer()
            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                .imageScale(.large)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}


struct RadioButtonAPIGuestRow: View {
    let guest: APIGuestOption
    let isSelected: Bool

    var body: some View {
        HStack {
            Text(guest.rawValue)
            Spacer()
            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                .imageScale(.large)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}
