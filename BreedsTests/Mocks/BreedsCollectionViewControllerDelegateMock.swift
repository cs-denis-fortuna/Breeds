//
//  BreedsCollectionViewControllerDelegateMock.swift
//  BreedsTests
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

@testable import Breeds

final class BreedsCollectionViewControllerDelegateMock: BreedsCollectionViewControllerDelegate {

    var didCallSelectImage: Bool = false

    func didSelectImage(_ selectedImage: Image) {
        didCallSelectImage = true
    }
}
