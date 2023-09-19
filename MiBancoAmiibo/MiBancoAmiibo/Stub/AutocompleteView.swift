//
//  AutocompleteView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 13/09/23.
//

import SwiftUI

struct AutocompleteView: View {
    
    @ObservedObject var viewModel: StubViewModel
    
    @State private var searchText = ""
    @State private var filteredButtons: [String] = ["Haruka", "Chihaya", "Yukiho", "Yayoi", "Ritsuko"]
    @State private var sectionStates: [Bool] = [false, false, false]
    @State private var clients: [String] = ["Haruka", "Chihaya", "Yukiho", "Yayoi", "Ritsuko"]

    var body: some View {
        VStack {
            switch viewModel.state {
            case .autocomplete:
                TextField("Autocomplete", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: searchText) { newValue in
                        filterButtons()
                    }

                List(filteredButtons, id: \.self) { buttonTitle in
                    Button(action: {
//                        viewModel.changeState()
                        viewModel.client = ClientViewModel()
                        viewModel.getClient(supply: .offers)
                    }) {
                        Text(buttonTitle)
                    }
                }

            case .about:
                Form {
                    Section() {
                        DisclosureGroup(isExpanded: $sectionStates[0]) {
                            VStack(alignment: .leading) {
                                Text("CC 79779705")
                                Text("JUAN MANUEL MORENO BELTRAN")
                            }
                        } label: {
                            Text("INFORMACION PRINCIPAL")
                        }
                    }

                    Section() {
                        DisclosureGroup(isExpanded: $sectionStates[1]) {
                            VStack(alignment: .leading) {
                                Text("Calle 154 #16-25")
                                Text("(+57)301860558)")
                            }
                        } label: {
                            Text("INFORMACION DEL DOMICILIO")
                        }
                    }

                    Section() {
                        DisclosureGroup(isExpanded: $sectionStates[2]) {
                            VStack(alignment: .leading) {
                                Text("GERENTE")
                                Text("Samtel")
                            }
                        } label: {
                            Text("INFORMACION DEL NEGOCIO")
                        }
                    }
                }
                .onAppear() {
                    // Initialize section states to collapsed initially
                    sectionStates = [false, false, false]
                }
            case .offers:
                Form {
                    Section() {
                        DisclosureGroup(isExpanded: $sectionStates[0]) {
                            VStack(alignment: .leading) {
                                Text("CC 79779705")
                                Text("JUAN MANUEL MORENO BELTRAN")
                            }
                        } label: {
                            Text("INFORMACION X")
                        }
                    }
                }
                .onAppear() {
                    // Initialize section states to collapsed initially
                    sectionStates = [false, false, false]
                }
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
