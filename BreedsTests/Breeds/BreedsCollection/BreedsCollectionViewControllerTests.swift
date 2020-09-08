//
//  BreedsCollectionViewControllerTests.swift
//  BreedsTests
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import Quick
import Nimble

@testable import Breeds

final class BreedsCollectionViewControllerTests: QuickSpec {

    override func spec() {
        var sut: BreedsCollectionViewController!

        var networkMock: NetworkManagerMock!
        var delegateMock: BreedsCollectionViewControllerDelegateMock!

        beforeEach {
            networkMock = NetworkManagerMock()
            delegateMock = BreedsCollectionViewControllerDelegateMock()

            sut = BreedsCollectionViewController(networkManager: networkMock)
            sut.coordinator = delegateMock
        }

        describe("viewDidLoad") {

            beforeEach {
                sut.viewDidLoad()
            }

            it("calls request on requestManager with imageList service") {
                let expectedService = ImageService.imageList(limit: 20)
                let calledService = networkMock.calledRequestWithService

                expect(calledService?.path).to(equal(expectedService.path))
                expect(calledService?.parameters?["limit"] as? Int).to(equal(expectedService.parameters?["limit"] as? Int))
            }
        }

        describe("showDetailForSelectedBreed") {

            beforeEach {
                let selectedImage = createMockImage()

                sut.showDetailForSelectedBreed(selectedImage)
            }

            it("calls didSelectImage on delegate") {
                expect(delegateMock.didCallSelectImage).to(beTrue())
            }
        }

        func createMockImage() -> Image {
            Image(breeds: [], id: "id", url: "url", width: 0, height: 0)
        }
    }
}
