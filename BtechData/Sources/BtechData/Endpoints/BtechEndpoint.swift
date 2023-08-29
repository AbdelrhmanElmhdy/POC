//
//  BtechEndpoint.swift
//
//
//  Created by Abdelrhman Elmahdy on 08/08/2023.
//

import Foundation
import Networking

enum BtechEndpoint: RemoteEndpoint {

    case allCities

    var baseUrl: URL {
        BtechData.config.baseURL
    }

    var path: String {
        "allCities"
    }

    var httpMethod: Networking.HTTPMethod {
        .get
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
