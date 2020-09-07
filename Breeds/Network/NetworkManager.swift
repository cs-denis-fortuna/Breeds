//
//  NetworkManager.swift
//  Breeds
//
//  Created by nicholas.r.babo on 04/09/20.
//  Copyright © 2020 borges.erick. All rights reserved.
//

import Foundation
import Alamofire

final class NetworkManager {

    func request<T: Decodable>(service: ServiceProtocol,
                               responseType: T.Type,
                               completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: service.path) else { return }
        AF.request(url,
                   method: service.method,
                   parameters: service.parameters,
                   headers: HTTPHeaders(service.headers ?? [:])).responseData { [weak self] response in
                    guard let self = self else { return }

                    switch response.result {
                    case .success(let data):
                        if let object: T = self.decode(data: data) {
                            completion(.success(object))
                        }
                        completion(.failure(NSError()))
                    case .failure(let error):
                        completion(.failure(error))
                    }
        }
    }

    private func decode<T: Decodable>(data: Data) -> T? {
        let decoder = JSONDecoder()

        guard let object = try? decoder.decode(T.self, from: data) else {
            return nil
        }

        return object
    }
}
