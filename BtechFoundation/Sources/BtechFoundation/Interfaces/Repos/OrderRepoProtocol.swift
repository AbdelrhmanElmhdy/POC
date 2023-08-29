//
//  OrderRepoProtocol.swift
//
//
//  Created by Abdelrhman Elmahdy on 31/07/2023.
//

import Foundation

protocol OrderRepoProtocol {
    func fetchOrder(ofID: UUID)
    func add(_ deliveryAddress: DeliveryAddress, to order: Order) async -> Result<Void, Error>
    func updateAddress(in order: Order, with address: DeliveryAddress) async -> Result<Void, Error>
    func removeAddress(ofID: UUID, from order: Order) async -> Result<Void, Error>
}
