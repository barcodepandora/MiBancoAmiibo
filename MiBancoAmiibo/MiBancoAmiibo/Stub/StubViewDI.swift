//
//  StubViewDI.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import Foundation

struct StubViewDI {
    
    var stubView: StubView {
        StubView(viewModel: stubViewModel, isLoggedIn: .constant(true))
    }
                 
     var stubViewModel: StubViewModel {
        StubViewModel()
     }
}
