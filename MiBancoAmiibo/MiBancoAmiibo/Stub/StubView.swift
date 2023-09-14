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
    
    // MARK: Profile
    @State private var isUserProfilePresented = false
        
    // MARK: Logged
    @Binding var isLoggedIn: Bool

    // MARK: Tab
    @State private var selectedTab = 0
    
//(506) 8756-9484
    
    var body: some View {
        NavigationView {
            TabView {
                
                // Tab 1
                NavigationView {
                    VStack {
                        VStack {
                            Text("FIC - FICHA DEL CLIENTE")
                            RadioButtonView(viewModel: viewModel)
                            CarouselView()
                        }
                        VStack {
                            AutocompleteView()
                        }
                    }
                }
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("FIC")
                }
                .tag(0)
                
                // Tab 2
                NavigationView {
                    Text("MiBanco M2")
                }
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("MiBanco M2")
                }
                .tag(1)
                
                // Tab 3
                NavigationView {
                    Text("MiBanco M3")
                }
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("MiBanco M3")
                }
                .tag(2)
            }
            .navigationBarItems(trailing:
                Button(action: {
                    self.isUserProfilePresented.toggle()
                }) {
                    Image(systemName: "person.circle")
                        .font(.title)
                }
            )
        }
        .sheet(isPresented: $isUserProfilePresented) {
            ProfileView(isLoggedIn: $isLoggedIn)
        }
    }
}

enum IdentifyOption: String, CaseIterable {
    case dni = "Tipo de Documento"
    case fullName = "Nombres y Apellidos"
}

enum APIGuestOption: String, CaseIterable {
    case mibanco = "Aqui MiBanco"
    case amiibo = "Aqui Mock"
}

struct StubView_Previews: PreviewProvider {
    static var previews: some View {
        StubView(viewModel: StubViewModel(), isLoggedIn: .constant(true))
    }
}


