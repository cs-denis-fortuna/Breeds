//
//  Image+Stub.swift
//  BreedsTests
//
//  Created by denis.fortuna on 07/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

@testable  import Breeds

extension Image {
    static func stub (breeds: [Breed] = [.stub()], url: String = "") -> Image {
            return Image(breeds: breeds, id: "", url: url, width: 0, height: 0)
    }
}
