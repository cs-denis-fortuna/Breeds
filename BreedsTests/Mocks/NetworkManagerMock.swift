//
//  NetworkManagerMock.swift
//  BreedsTests
//
//  Created by nicholas.r.babo on 07/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

@testable import Breeds

final class NetworkManagerMock: NetworkManagerProtocol {

    var calledRequestWithService: ServiceProtocol?

    func request<T>(service: ServiceProtocol,
                    responseType: T.Type,
                    completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        calledRequestWithService = service
    }
}
