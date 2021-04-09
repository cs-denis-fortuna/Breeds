//
//  BreedDetailViewSpec.swift
//  BreedsTests
//
//  Created by denis.fortuna on 08/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable  import Breeds

class BreedDetailViewSpec: QuickSpec {
    
    override func spec() {
        describe("BreedDetailView") {
            var sut: BreedDetailView!
            
            context("when initialized") {
                beforeEach {
                    sut = BreedDetailView()
                    sut.setup(breed: .stub(), imageUrl: AssetHelper.LocalImage.carameloDog.url)
                    sut.frame.size = CGSize(width: 375, height: 600)
                }
                
                it("should layout itself properly") {
                    expect(sut).toEventually(haveValidSnapshot(named: "BreedDetailView_Layout"), timeout: 1)
                }
            }
        }
    }
}
