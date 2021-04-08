//
//  BreedCollectionViewCellSpec.swift
//  Breeds
//
//  Created by denis.fortuna on 07/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
////


import Quick
import Nimble
import Nimble_Snapshots

@testable import Breeds

class BreedCollectionViewCellSpec: QuickSpec {
    
    override func spec() {
        
        describe("BreedCollectionViewCell") {
            var sut: BreedCollectionViewCell!
            
            context("when initialized") {
                beforeEach {
                    sut = BreedCollectionViewCell()
                    sut.setup(image: .stub(url: AssetHelper.LocalImage.carameloDog.url))
                    sut.frame.size = CGSize(width: 200, height: 200)
                }
                
                it("should layout itself properly") {
                    expect(sut).toEventually(recordSnapshot(named: "BreedCollectionViewCell_Layout", identifier: nil, usesDrawRect: false), timeout: 0.5)
                }
            }
                
        }
    }
}
