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
    @Published var selectedOption: TypeIdentifyOption = .dni

    enum PageState {
        case empty
        case autocomplete
        case about
        case offers
    }
    
    init() {
        self.client = ClientViewModel()
        self.state = .empty
    }
    
    func getClient(supply: Supply) {
        switch self.selectedAPIGuest {
        case .amiibo:
            APICliente.darAmiibo(completion: { (amiiboEnvelope) in
                self.client = ClientViewModel(number: (amiiboEnvelope.amiibo?.amiiboSeries)!)
                self.changeState(supply: supply)
            })
        case .mibanco:
            APICliente.darAmiibo(completion: { (amiiboEnvelope) in
                self.client = ClientViewModel(number: (amiiboEnvelope.amiibo?.amiiboSeries)!)
                self.changeState(supply: supply)
//                self.selectedOption = .dni
            })
        case .none:
            break
        }
    }
    
    func changeState(supply: Supply) {
        switch supply {
        case .autocomplete:
            self.state = .autocomplete
        case .basics:
            self.state = .about
        case .offers:
            self.state = .offers
        case .risk:
            self.state = .about
        case .history:
            self.state = .offers
        case .fund:
            self.state = .about
        case .debt:
            self.state = .offers
        case .contact:
            self.state = .about
        case .pqr:
            self.state = .offers
        }
    }
}
