//
//  UserRepoProtocol.swift
//  
//
//  Created by Abdelrhman Elmahdy on 31/07/2023.
//

import Foundation

public protocol UserRepoProtocol {
    func addAddress(_ address: DeliveryAddress)
    func updateAddress(ofID: UUID, with deliveryAddress: DeliveryAddress, forOrder order: Order)
    func removeAddress(ofID addressID: UUID)
    func getAllSavedAddresses(in area: Area) async -> Result<[DeliveryAddress], NetworkRequestError>
}
