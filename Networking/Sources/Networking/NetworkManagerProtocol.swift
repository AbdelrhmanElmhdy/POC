//
//  NetworkManagerProtocol.swift
//  StarWars
//
//  Created by Abdelrhman Elmahdy on 15/03/2023.
//

import BtechFoundation
import Combine

public protocol NetworkManagerProtocol {
    func executeRequest<T: Decodable>(_ endpoint: any RemoteEndpoint) async -> Result<T, NetworkRequestError>
}
