//
//  BreedDetailViewTests.swift
//  BreedsTests
//
//  Created by nicholas.r.babo on 18/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Breeds

final class BreedDetailViewTests: QuickSpec {

    override func spec() {

        var sut: BreedDetailView!

        beforeEach {
            sut = BreedDetailView()
            sut.frame = UIScreen.main.bounds
        }

        describe("setup") {

            it("has a valid snapshot") {
                sut.setup(breed: BreedFactory.build(),
                          imageUrl: AssetHelper.LocalImage.doguinho.url)

                expect(sut).toEventually(haveValidSnapshot())
            }

            context("multiple attributes") {
                beforeEach {
                    sut.setup(breed: BreedFactory.build(bredFor: "Playing with kids",
                                                        breedGroup: "Breed group",
                                                        temperament: "angry",
                                                        origin: "wakanda"),
                              imageUrl: AssetHelper.LocalImage.doguinho.url)
                }

                it("has a valid snapshot") {
                    expect(sut).toEventually(haveValidSnapshot())
                }

                context("on iPhone X") {
                    it("has a valid snapshot") {
                        expect(sut).toEventually(haveValidDynamicSizeSnapshot(sizes: ["iPhoneX": CGRect.iPhoneX.size]))
                    }
                }
            }
        }
    }
}
