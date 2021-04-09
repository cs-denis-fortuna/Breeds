//
//  ServiceProtocol.swift
//  Breeds
//
//  Created by denis.fortuna on 09/04/21.
//  Copyright © 2021 borges.erick. All rights reserved.
//

import Alamofire

protocol ServiceProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}
