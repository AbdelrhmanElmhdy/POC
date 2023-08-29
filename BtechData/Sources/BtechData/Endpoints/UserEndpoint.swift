//
//  UserEndpoint.swift
//
//
//  Created by Abdelrhman Elmahdy on 08/08/2023.
//

import BtechFoundation
import Foundation
import Networking

enum UserEndpoint: RemoteEndpoint {
    case getAllAddresses(in: Area)
    case addNewAddress(DeliveryAddress)

    var baseUrl: URL {
        BtechData.config.baseURL
    }

    var path: String {
        switch self {
        case .getAllAddresses:
            return "customer/addresses"
        case .addNewAddress:
            return "customer/add_new_address"
        }
    }

    var httpMethod: Networking.HTTPMethod {
        switch self {
        case .getAllAddresses:
            return .get
        case .addNewAddress:
            return .post
        }
    }

    var bodyParameters: RequestParameters? {
        nil
    }

    var urlParameters: RequestParameters? {
        nil
    }

    var headers: HTTPHeaders? {
        ["content": "application/json"]
    }

    var connectedCachePolicy: URLRequest.CachePolicy {
        .reloadRevalidatingCacheData
    }

    var noConnectionCachePolicy: URLRequest.CachePolicy {
        .returnCacheDataDontLoad
    }
}
