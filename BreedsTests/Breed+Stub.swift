//
//  Breed+Stub.swift
//  BreedsTests
//
//  Created by denis.fortuna on 07/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

@testable import Breeds

extension Breed {
    static func stub(
        weight: Dimension = Dimension(imperial: "33", metric: "100"),
        height: Dimension = Dimension(imperial: "33", metric: "100"),
        name: String = "Caramelo",
        bredFor: String? = nil,
        breedGroup: String? = nil,
        lifeSpan: String = "15 years" ,
        temperament: String? = nil,
        origin: String? = nil) -> Breed {
        return Breed(weight: weight,
                     height: height,
                     id: 0,
                     name: name,
                     bredFor: bredFor,
                     breedGroup: breedGroup,
                     lifeSpan: lifeSpan,
                     temperament: temperament,
                     origin: origin,
                     countryCode: nil,
                     breedDescription: nil,
                     history: nil)
    }
}

