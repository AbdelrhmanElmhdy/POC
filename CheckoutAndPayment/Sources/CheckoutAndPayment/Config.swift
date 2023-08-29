//
//  Config.swift
//
//
//  Created by Abdelrhman Elmahdy on 08/08/2023.
//

import BtechFoundation
import Foundation

public protocol Config {
    var cityRepo: CityRepoProtocol { get }
    var userRepo: UserRepoProtocol { get }
}
