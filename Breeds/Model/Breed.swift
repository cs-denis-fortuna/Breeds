//
//  Breed.swift
//  Breeds
//
//  Created by nicholas.babo on 05/08/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import Foundation

struct Breed: Codable {
    let weight: Dimension
    let height: Dimension
    let id: Int
    let name: String
    let bredFor: String?
    let breedGroup: String?
    let lifeSpan: String
    let temperament: String?
    let origin: String?
    let countryCode: String?
    let breedDescription: String?
    let history: String?

    enum CodingKeys: String, CodingKey {
        case weight
        case height
        case id
        case name
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case lifeSpan = "life_span"
        case temperament
        case origin
        case countryCode = "country_code"
        case breedDescription = "description"
        case history
    }
}

struct Dimension: Codable {
    let imperial: String
    let metric: String
}
