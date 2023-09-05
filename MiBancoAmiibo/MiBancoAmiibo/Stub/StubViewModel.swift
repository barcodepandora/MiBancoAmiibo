//
//  StubViewModel.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import Foundation

final class StubViewModel: ObservableObject {
    
//    @Published var amiiboEnvelope = AmiiboEnvelopeDecodable()
    
    init() {
        self.darAmiibo()
    }
    
    func darAmiibo() {
//        APICliente.darAmiibo(completion: { (response, error) in
//            debugPrint("En obra")
//        })
        APICliente.darAmiibo(completion: { (amiiboEnvelope) in
//            self.amiiboEnvelope = amiiboEnvelope
        })
    }
}
