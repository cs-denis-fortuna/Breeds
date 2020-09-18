//
//  BreedCollectionViewCellTests.swift
//  BreedsTests
//
//  Created by nicholas.r.babo on 17/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import Breeds

final class BreedCollectionViewCellTests: QuickSpec {

    override func spec() {
        var sut: BreedCollectionViewCell!

        beforeEach {
            sut = BreedCollectionViewCell()
            sut.frame.size = CGSize(width: 200, height: 200)
        }

        describe("setup") {

            it("has a valid layout") {
                sut.setup(name: "Caramelo", url: AssetHelper.LocalImage.carameloDog.url)

                expect(sut).toEventually(haveValidSnapshot())
            }

            context("large name") {

                it("has a valid layout") {
                    sut.setup(name: "Um belo cachorro caramelo",
                              url: AssetHelper.LocalImage.carameloDog.url)

                    expect(sut).toEventually(haveValidSnapshot())
                }
            }

            context("image with large width") {

                it("has a valid layout") {
                    sut.setup(name: "Caramelo",
                              url: AssetHelper.LocalImage.doguinho.url)

                    expect(sut).toEventually(haveValidSnapshot())
                }
            }

            context("image with large height") {

                it("has a valid layout") {
                    sut.setup(name: "Caramelo",
                              url: AssetHelper.LocalImage.puppy.url)

                    expect(sut).toEventually(haveValidSnapshot())
                }
            }
        }
    }

}
