//
//  StubView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import SwiftUI

struct StubView: View {
    
    // MARK: View Model
    @ObservedObject var viewModel = StubViewModel()

    // MARK: Carousel
    @State private var index = 0
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    private let images: [String] = ["Haruka_ofa_casual", "Chihaya_ofa_casual", "Yukiho_ofa_casual"]
    
    @State private var selectedIdentify: IdentifyOption? = .dni
    
    @State private var clients: [String] = ["Haruka", "Chihaya", "Yukiho", "Yayoi", "Ritsuko"]
    
    @State private var searchText = ""
    @State private var filteredButtons: [String] = ["Haruka", "Chihaya", "Yukiho", "Yayoi", "Ritsuko"]
    
    @State private var sectionStates: [Bool] = [false, false, false]
        
    enum IdentifyOption: String, CaseIterable {
        case dni = "Tipo de Documento"
        case fullName = "Nombres y Apellidos"
    }
        
    enum APIGuestOption: String, CaseIterable {
        case mibanco = "Aqui MiBanco"
        case amiibo = "Aqui Mock"
    }

    var body: some View {
        VStack {
            Text("FIC - FICHA DEL CLIENTE")
            VStack {
                VStack {
                    Form {
                        Section(header: Text("")) {
                            ForEach(APIGuestOption    .allCases, id: \.self) { guest in
                                RadioButtonAPIGuestRow(
                                    guest: guest,
                                    isSelected: viewModel.selectedAPIGuest == guest
                                )
                                .onTapGesture {
                                    viewModel.selectedAPIGuest = guest
                                }
                            }
                        }
                    }
                    Form {
                        Section(header: Text("")) {
                            ForEach(IdentifyOption    .allCases, id: \.self) { identify in
                                RadioButtonRow(
                                    identify: identify,
                                    isSelected: selectedIdentify == identify
                                )
                                .onTapGesture {
                                    selectedIdentify = identify
                                }
                            }
                        }
                    }
                    VStack {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                CardView(dishName: "H", dishImage: "Haruka_ofa_casual")
                                CardView(dishName: "C", dishImage: "Chihaya_ofa_casual")
                                CardView(dishName: "Y", dishImage: "Yukiho_ofa_casual")
                                CardView(dishName: "H", dishImage: "Haruka_ofa_casual")
                                CardView(dishName: "C", dishImage: "Chihaya_ofa_casual")
                                CardView(dishName: "Y", dishImage: "Yukiho_ofa_casual")
                                CardView(dishName: "H", dishImage: "Haruka_ofa_casual")
                            }
                        }
                    }
                    HStack {
                        Button {
                            //                        viewModel.darAmiibo()
                        } label: {
                            Text("CONSULTAR")
                        }
                        Button {
                            //                        viewModel.darAmiibo()
                        } label: {
                            Text("LIMPIAR")
                        }
                    }
                }
            }
            VStack {
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
                                viewModel.changeState()
                                viewModel.client = ClientViewModel()
                                viewModel.getClient()
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
                    }
                }
            }
//            VStack {
//                Button {
//                    viewModel.darAmiibo()
//                } label: {
//                    Text(viewModel.amiiboEnvelope.amiibo?.amiiboSeries ?? "Welcome")
//                }
//            }
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

struct CardView: View {
    let dishName: String
    let dishImage: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .green]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 78, height: 160, alignment: .center)
            VStack {
                Image("\(dishImage)").resizable().frame(width: 78, height: 160, alignment: .top)
            }
        }
    }
}

struct RadioButtonRow: View {
    let identify: StubView.IdentifyOption
    let isSelected: Bool

    var body: some View {
        HStack {
            Text(identify.rawValue)
            Spacer()
            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                .imageScale(.large)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}


struct RadioButtonAPIGuestRow: View {
    let guest: StubView.APIGuestOption
    let isSelected: Bool

    var body: some View {
        HStack {
            Text(guest.rawValue)
            Spacer()
            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                .imageScale(.large)
                .foregroundColor(isSelected ? .blue : .gray)
        }
    }
}

struct StubView_Previews: PreviewProvider {
    static var previews: some View {
        StubViewDI().stubView
    }
}
