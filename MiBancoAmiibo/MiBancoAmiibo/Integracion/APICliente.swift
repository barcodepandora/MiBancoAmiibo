//
//  APICliente.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import Foundation
import Alamofire

class APICliente {
    static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return JSONDecoder()
    }()
    
    static func darAmiibo(completion: @escaping (AmiiboEnvelopeDecodable) -> Void) {
        AF.request("https://www.amiiboapi.com/api/amiibo/?id=0x0000010000190002")
        .responseDecodable(of: AmiiboEnvelopeDecodable.self, decoder: decoder) { response in
            debugPrint(response)
            switch response.result {
            case .success(let value):
                debugPrint(value)
                completion(value)
            case .failure(_):
                debugPrint("KO")
            }
        }
    }
}
