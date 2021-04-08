//
//  ViewCodable.swift
//  Breeds
//
//  Created by denis.fortuna on 06/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

import Foundation

protocol ViewCodable {
    func setupViews()
    func setupViewHierarchy()
    func setupConstraints()
    func setupAditionalConfiguration()
}

extension ViewCodable {
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
        setupAditionalConfiguration()
    }
    
    func setupAditionalConfiguration() { }
}
