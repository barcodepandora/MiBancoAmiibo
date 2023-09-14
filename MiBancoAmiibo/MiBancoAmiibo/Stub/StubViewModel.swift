//
//  StubViewModel.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import Foundation

final class StubViewModel: ObservableObject {
    
    @Published var client: ClientViewModelProtocol
    
    @Published private(set) var state = PageState.autocomplete
        
    @Published var selectedAPIGuest: APIGuestOption? = .mibanco

    enum PageState {
        case autocomplete
        case about
    }
    
    init() {
        self.client = ClientViewModel()
    }
    
    func getClient() {
        switch self.selectedAPIGuest {
        case .amiibo:
            APICliente.darAmiibo(completion: { (amiiboEnvelope) in
                self.client = ClientViewModel(number: (amiiboEnvelope.amiibo?.amiiboSeries)!)
                self.changeState()
            })
        case .mibanco:
            break
        case .none:
            break
        }
    }
    
    func changeState() {
        self.state = .about
    }
}
