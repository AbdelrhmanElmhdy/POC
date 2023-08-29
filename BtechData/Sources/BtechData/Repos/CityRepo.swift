//
//  CityRepo.swift
//
//
//  Created by Abdelrhman Elmahdy on 08/08/2023.
//

import BtechFoundation
import Foundation
import Networking

public struct CityRepo: CityRepoProtocol {
    let networkManager: NetworkManager

    public init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    public func getAllCities() async -> Result<[City], NetworkRequestError> {
        await networkManager.executeRequest(BtechEndpoint.allCities)
    }

    public func getAllCities(completion: @escaping ([City]?, NetworkRequestError?) -> Void) {
        networkManager.executeRequest(BtechEndpoint.allCities, responseType: [City].self) { cities, error in
            if let cities = cities {
                completion(cities, error)
                return
            }
        }
    }
}
