//
//  StubView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import SwiftUI

struct StubView: View {
    @ObservedObject var viewModel = StubViewModel()
    
    var body: some View {
        VStack {
            Text("Roof at Work")
            Text("Carousel at Work")
            VStack {
                Button {
                    viewModel.darAmiibo()
                } label: {
                    Text(viewModel.amiiboEnvelope.amiibo?.amiiboSeries ?? "Welcome")
                }
            }
        }
    }
}

struct StubView_Previews: PreviewProvider {
    static var previews: some View {
        StubViewDI().stubView
    }
}
