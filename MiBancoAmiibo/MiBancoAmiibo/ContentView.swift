//
//  ContentView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
//                StubViewDI().stubView
            StubView(viewModel: StubViewModel(), isLoggedIn: $isLoggedIn)
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
