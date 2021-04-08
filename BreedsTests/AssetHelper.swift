//
//  AssetHelper.swift
//  BreedsTests
//
//  Created by denis.fortuna on 07/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

import Foundation

class AssetHelper {
    
    enum LocalImage: String {
        case carameloDog = "caramelo_dog.jpg"

        var fileName: String {
            let components = rawValue.components(separatedBy: ".")
            return components[0]
        }
        
        var fileExtension: String {
            let components = rawValue.components(separatedBy: ".")
            return components[1]
        }
        
        var url: String {
//            guard let path = Bundle(for: AssetHelper.self).path(forResource: fileName, ofType: fileExtension) else { return "" }
            guard let path = Bundle.main.path(forResource: fileName, ofType: fileName) else { return "" }
            return URL(fileURLWithPath: path).absoluteString
            let aa = 1
        }
    }
}
