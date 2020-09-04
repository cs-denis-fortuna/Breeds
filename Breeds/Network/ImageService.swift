//
//  ImageService.swift
//  Breeds
//
//  Created by nicholas.r.babo on 04/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import Keys
import Alamofire

enum ImageService {
    case imageList(limit: Int)
}

extension ImageService: ServiceProtocol {
    var path: String {
        switch self {
        case .imageList:
            return "https://api.thedogapi.com/v1/images/search"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .imageList:
            return .get
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .imageList(let limit):
            return [
                "order": "Asc",
                "limit": limit,
                "page": 0
            ]
        }
    }

    var headers: [String: String]? {
        switch self {
        case .imageList:
            return ["x-api-key": BreedsKeys().theDogAPIKey]
        }
    }
}
