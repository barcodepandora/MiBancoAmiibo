//
//  Network.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 25/09/23.
//

import Foundation

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://countries.trevorblades.com/")!)
}
