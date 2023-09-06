//
//  StubViewModel.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import Foundation

final class StubViewModel: ObservableObject {
    
    @Published var amiiboEnvelope: AmiiboEnvelopeDecodable
    
    @Published private(set) var state = PageState.autocomplete
    
    enum PageState {
        case autocomplete
        case about
    }

    init() {
        self.amiiboEnvelope = AmiiboEnvelopeDecodable()
        self.darAmiibo()
    }
    
    func darAmiibo() {
        APICliente.darAmiibo(completion: { (amiiboEnvelope) in
            self.amiiboEnvelope = amiiboEnvelope
        })
    }
    
    func changeState() {
        self.state = .about
    }
}
