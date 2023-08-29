//
//  CityRepoProtocol.swift
//
//
//  Created by Abdelrhman Elmahdy on 08/08/2023.
//

import Foundation

public protocol CityRepoProtocol {
    func getAllCities() async -> Result<[City], NetworkRequestError>
    func getAllCities(completion: @escaping ([City]?, NetworkRequestError?) -> Void)
}
