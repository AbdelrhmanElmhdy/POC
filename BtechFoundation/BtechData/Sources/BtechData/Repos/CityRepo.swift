//
//  CityRepo.swift
//  Btech
//
//  Created by Abdelrhman Elmahdy on 08/08/2023.
//

import BtechFoundation
import Foundation
import Networking

struct CityRepo: CityRepoProtocol {
    let networkManager = NetworkManager()

    func getAllCities() async -> Result<[City], NetworkRequestError> {
        await networkManager.executeRequest(BtechEndpoint.allCities)
    }

    func getAllCities(completion: @escaping ([City]?, NetworkRequestError?) -> Void) {
        networkManager.executeRequest(BtechEndpoint.allCities, responseType: [City].self) { cities, error in
            if let cities = cities {
                completion(cities, error)
                return
            }
        }
    }
}
