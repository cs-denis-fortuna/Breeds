//
//  ViewCodable.swift
//  Breeds
//
//  Created by nicholas.r.babo on 17/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
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
