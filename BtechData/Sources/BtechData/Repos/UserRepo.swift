//
//  UserRepo.swift
//
//
//  Created by Abdelrhman Elmahdy on 11/08/2023.
//

import BtechFoundation
import Foundation
import Networking

public struct UserRepo: UserRepoProtocol {
    let networkManager: NetworkManager

    public init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    public func addAddress(_ address: DeliveryAddress) {
    }

    public func updateAddress(ofID: UUID, with deliveryAddress: DeliveryAddress, forOrder order: Order) {
    }

    public func removeAddress(ofID addressID: UUID) {
    }

    public func getAllSavedAddresses(in area: Area) async -> Result<[DeliveryAddress], NetworkRequestError> {
        await networkManager.executeRequest(UserEndpoint.getAllAddresses(in: area))
    }
}
