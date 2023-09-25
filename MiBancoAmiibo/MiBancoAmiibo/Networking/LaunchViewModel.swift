//
//  LaunchViewModel.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 25/09/23.
//

import Foundation

class LaunchViewModel: ObservableObject {
    
    init() {
        fetch()
    }
    
    func fetch() {
        Network.shared.apollo.fetch(query: CountryQuery()) { result in
            debugPrint(result)
        }
    }
}
