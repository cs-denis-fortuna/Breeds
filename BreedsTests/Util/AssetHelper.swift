//
//  AssetHelper.swift
//  BreedsTests
//
//  Created by nicholas.r.babo on 16/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import Foundation

final class AssetHelper {

    enum LocalImage: String {
        case doguinho = "doguinho.jpg"

        var fileName: String {
            let components = rawValue.components(separatedBy: ".")
            return components[0]
        }

        var fileExtension: String {
            let components = rawValue.components(separatedBy: ".")
            return components[1]
        }

        var url: URL? {
            let path = Bundle(for: AssetHelper.self).path(forResource: fileName, ofType: fileExtension) ?? ""
            return URL(fileURLWithPath: path)
        }
    }
}
