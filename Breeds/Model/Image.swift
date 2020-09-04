//
//  Images.swift
//  Breeds
//
//  Created by nicholas.babo on 06/08/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import Foundation

struct Image: Codable {
    let breeds: [Breed]
    let id: String
    let url: String
    let width: Int
    let height: Int
}
