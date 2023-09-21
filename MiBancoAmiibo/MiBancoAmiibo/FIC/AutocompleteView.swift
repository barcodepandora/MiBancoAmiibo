//
//  AutocompleteView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 13/09/23.
//

import SwiftUI

struct AboutNITView: View {
    
    @State private var isExpanded = [false, false]
    
    var body: some View {
        Form {
            Section() {
                DisclosureGroup(isExpanded: $isExpanded[0]) {
                    VStack(alignment: .leading) {
                        Text("Información Principal En Construcción")
                    }
                } label: {
                    Text("INFORMACION PRINCIPAL")
                }
                DisclosureGroup(isExpanded: $isExpanded[1]) {
                    VStack(alignment: .leading) {
                        Text("Información de la Empresa En Construcción")
                    }
                } label: {
                    Text("INFORMACION DE LA EMPRESA")
                }

            }
        }
    }
}

struct AboutDNIView: View {
    
    @State private var isExpanded = [false, false, false]
    
    var body: some View {
        Form {
            Section() {
                DisclosureGroup(isExpanded: $isExpanded[0]) {
                    VStack(alignment: .leading) {
                        Text("CC 79779705")
                        Text("JUAN MANUEL MORENO BELTRAN")
                    }
                } label: {
                    Text("INFORMACION PRINCIPAL")
                }
            }

            Section() {
                DisclosureGroup(isExpanded: $isExpanded[1]) {
                    VStack(alignment: .leading) {
                        Text("Calle 154 #16-25")
                        Text("(+57)301860558)")
                    }
                } label: {
                    Text("INFORMACION DEL DOMICILIO")
                }
            }

            Section() {
                DisclosureGroup(isExpanded: $isExpanded[2]) {
                    VStack(alignment: .leading) {
                        Text("GERENTE")
                        Text("Samtel")
                    }
                } label: {
                    Text("INFORMACION DEL NEGOCIO")
                }
            }
        }
    }
}

struct OfferView: View {
    
    @State private var isExpanded = [false, false]
    
    var body: some View {
        Form {
            Section() {
                DisclosureGroup(isExpanded: $isExpanded[0]) {
                    VStack(alignment: .leading) {
                        Text("Ofertas En Construcción")
                    }
                } label: {
                    Text("OFERTAS")
                }
                DisclosureGroup(isExpanded: $isExpanded[1]) {
                    VStack(alignment: .leading) {
                        Text("Alertas En Construcción")
                    }
                } label: {
                    Text("ALERTAS")
                }

            }
        }
    }
}

struct NotebookView: View {
    
    @ObservedObject var viewModel: StubViewModel
    
    var body: some View {
        VStack {

            if viewModel.flavor == .onboarding {
                CarouselView(viewModel: viewModel)
            }

            switch viewModel.state {
            case .about:
                switch viewModel.selectedOption {
                case .dni:
                    AboutDNIView()
                case .nit:
                    AboutNITView()
                }
            case .offers:
                OfferView()
            default:
                EmptyView()
            }
        }
    }
}

struct AutocompleteView: View {
    
    @ObservedObject var viewModel: StubViewModel
    
    @State private var searchText = ""
    @State private var filteredButtons: [String] = ["Juan Manuel Moreno", "Miguel Angel Reyes", "David Baron", "Luis Carlos Garzon", "José Julián Abreo", "Ingrid Geraldine Bonilla"]
    @State var sectionStates: [Bool] = [false, false, false]
    @State private var clients: [String] = ["Juan Manuel Moreno", "Miguel Angel Reyes", "David Baron", "Luis Carlos Garzon", "José Julián Abreo", "Ingrid Geraldine Bonilla"]
    @State private var isView1Presented = false
    
    var body: some View {
        VStack {
            switch viewModel.state {
            case .empty:
                EmptyView()
            case .autocomplete:
                TextField("Autocomplete", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: searchText) { newValue in
                        filterButtons()
                    }

                List(filteredButtons, id: \.self) { buttonTitle in
                    switch viewModel.flavor {
                    case .chunk:
                        Button(action: {
                            viewModel.client = ClientViewModel()
                            viewModel.getClient(supply: .basics)
                        }) {
                            Text(buttonTitle)
                        }
                    case .onboarding:
                        NavigationLink(buttonTitle, destination: NotebookView(viewModel: viewModel), isActive: $isView1Presented)
                            .simultaneousGesture(TapGesture().onEnded {
                                viewModel.getClient(supply: .basics)
                            })
                    }
                }
            case .about, .offers:
                NotebookView(viewModel: viewModel)
            }
        }
    }
    
    func filterButtons() {
        if searchText.isEmpty {
            filteredButtons = clients
        } else {
            filteredButtons = clients.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
}
