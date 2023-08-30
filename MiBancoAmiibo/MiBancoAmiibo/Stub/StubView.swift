//
//  StubView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import SwiftUI

struct StubView: View {
    @ObservedObject var viewModel: StubViewModel
    
    var body: some View {
        Button {
            viewModel.darAmiibo()
        } label: {
            Text("Vamos")
        }
    }
}

struct StubView_Previews: PreviewProvider {
    static var previews: some View {
        StubViewDI().stubView
    }
}
