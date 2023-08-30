//
//  AmiiboDecodable.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import Foundation

class ReleaseDecodable: Decodable {
    var au: String?
    var eu: String?
    var jp: String?
    var na: String?
    
    enum CodingKeys: String, CodingKey {
        case au = "au"
        case eu = "eu"
        case jp = "jp"
        case na = "na"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        au = try values.decodeIfPresent(String.self, forKey: .au)
        eu = try values.decodeIfPresent(String.self, forKey: .eu)
        jp = try values.decodeIfPresent(String.self, forKey: .jp)
        na = try values.decodeIfPresent(String.self, forKey: .na)
    }
}

class AmiiboDecodable: Decodable {
    var amiiboSeries: String?
    var character: String?
    var gameSeries: String?
    var head: String?
    var image: String?
    var name: String?
    var release: ReleaseDecodable?
    var tail: String?
    var type: String?

    enum CodingKeys: String, CodingKey {
        case amiiboSeries = "amiiboSeries"
        case character = "character"
        case gameSeries = "gameSeries"
        case head = "head"
        case image = "image"
        case name = "name"
        case release = "release"
        case tail = "tail"
        case type = "type"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        amiiboSeries = try values.decodeIfPresent(String.self, forKey: .amiiboSeries)
        character = try values.decodeIfPresent(String.self, forKey: .character)
        gameSeries = try values.decodeIfPresent(String.self, forKey: .gameSeries)
        head = try values.decodeIfPresent(String.self, forKey: .head)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        release = try values.decodeIfPresent(ReleaseDecodable.self, forKey: .release)
        tail = try values.decodeIfPresent(String.self, forKey: .tail)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

class AmiiboEnvelopeDecodable: Decodable {
    var amiibo: AmiiboDecodable?
    
    enum CodingKeys: String, CodingKey {
        case amiibo = "amiibo"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        amiibo = try values.decodeIfPresent(AmiiboDecodable.self, forKey: .amiibo)
    }
}
