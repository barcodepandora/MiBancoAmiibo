//
//  ClientViewModelProtocol.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 7/09/23.
//

import Foundation

protocol ClientViewModelProtocol {
    var number: String { get }
}

class ClientViewModel: ClientViewModelProtocol {
    var number: String = ""
    
    init() { }
    
    init(number: String) {
        self.number = number
    }
}
