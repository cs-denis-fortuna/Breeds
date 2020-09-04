//
//  ServiceProtocol.swift
//  Breeds
//
//  Created by nicholas.r.babo on 04/09/20.
//  Copyright © 2020 babo.nicholas. All rights reserved.
//

import Alamofire

protocol ServiceProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
}
