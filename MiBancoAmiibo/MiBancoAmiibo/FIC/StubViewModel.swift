//
//  StubViewModel.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import Foundation
import SwiftUI

final class StubViewModel: ObservableObject {
    
    @Published var client: ClientViewModelProtocol
    @Published private(set) var state = PageState.autocomplete
    @Published var selectedAPIGuest: APIGuestOption? = .mibanco
    @Published var selectedOption: TypeIdentifyOption = .dni
    @Published var flavor: Flavor = .chunk
    @Published var viewState: ViewState = EmptyState()
    @Published var viewFlavor: ViewFlavor = CarouselFlavor()

    enum PageState {
        case empty
        case autocomplete
        case about
        case offers
    }
    
    init() {
        self.client = ClientViewModel()
        self.state = .empty
//        self.flavor = .onboarding
        self.changeViewState()
        self.changeViewFlavor()
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
                self.changeViewState()
                self.changeViewFlavor()
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
    
    func changeViewState() {
        switch state {
        case .empty:
            viewState = EmptyState()
        default:
            viewState = AutocompleteState()
        }
    }
    
    func changeViewFlavor() {
        switch flavor {
        case .chunk:
            viewFlavor = CarouselFlavor()
        case .onboarding:
            viewFlavor = NavigationFromIdentifyFlavor()
        }
    }
}

// View by State
protocol ViewState {
    func makeView(viewModel: StubViewModel) -> AnyView
}

extension ViewState {
    func makeView(viewModel: StubViewModel) -> AnyView {
        fatalError("Subclasses must implement this method")
    }
}

struct EmptyState: ViewState {
    func makeView(viewModel: StubViewModel) -> AnyView {
        return AnyView(EmptyView())
    }
}

struct AutocompleteState: ViewState {
    func makeView(viewModel: StubViewModel) -> AnyView {
        return AnyView(AutocompleteView(viewModel: viewModel))
    }
}

// View by Flavor
protocol ViewFlavor {
    func makeView(viewModel: StubViewModel) -> AnyView
}

extension ViewFlavor {
    func makeView(viewModel: StubViewModel) -> AnyView {
        fatalError("Subclasses must implement this method")
    }
}

struct CarouselFlavor: ViewFlavor {
    func makeView(viewModel: StubViewModel) -> AnyView {
        return AnyView(CarouselView(viewModel: viewModel))
    }
}

struct NavigationFromIdentifyFlavor: ViewFlavor {
    @State private var isView1Presented = false
    
    func makeView(viewModel: StubViewModel) -> AnyView {
        return AnyView(
            NavigationLink("Consultar", destination: AutocompleteView(viewModel: viewModel), isActive: $isView1Presented)
                .simultaneousGesture(TapGesture().onEnded {
                    viewModel.getClient(supply: .autocomplete)
                })

        )
    }
}
