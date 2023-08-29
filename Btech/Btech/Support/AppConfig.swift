//
//  AppConfig.swift
//  Btech
//
//  Created by Abdelrhman Elmahdy on 08/08/2023.
//

import BtechData
import BtechFoundation
import CheckoutAndPayment
import Foundation
import Networking

struct AppConfig: BtechData.Config, CheckoutAndPayment.Config {
    static let networkManager = NetworkManager()

    let baseURL = URL(string: "https://btech.com")!
    let cityRepo: CityRepoProtocol = CityRepo(networkManager: Self.networkManager)
    let userRepo: UserRepoProtocol = UserRepo(networkManager: Self.networkManager)
}


