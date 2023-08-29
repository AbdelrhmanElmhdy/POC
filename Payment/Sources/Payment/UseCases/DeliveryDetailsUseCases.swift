//
//  DeliveryDetailsUseCases.swift
//
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import BtechFoundation
import Foundation

protocol ChecksOMS {
    static func areProducts(in order: Order, availableFor deliveryAddress: DeliveryAddress) -> Bool
}

extension ChecksOMS {
    static func areProducts(in order: Order, availableFor deliveryAddress: DeliveryAddress) -> Bool {
        true
    }
}

public struct CheckStockUseCase {
    // carts/mine/oms-outofstock
}

public struct GetDeliveryDateUseCase {
    // oms/checkout/getdelivery
}

public struct GetSavedAddressesUseCase {
    // customer/addresses
}

public struct GetPickupStoresUseCase {
    // oms/checkout/getstores/
}

public struct GetPickupStorsesUseCase {
    // oms/checkout/getstores/
}

public struct AddAddressUseCase: ChecksOMS {
    public static func add(_ deliveryAddress: DeliveryAddress, to order: Order) async -> Result<Void, Error> {
        let areProductsInStock = areProducts(in: order, availableFor: deliveryAddress)
        guard areProductsInStock else { return .failure(OMSError.productOutOfStock) }

        return .success
    }

    public static func add(_ deliveryAddress: DeliveryAddress, to user: User) async -> Result<Void, Error> {
        .success
    }
}

public struct UpdateAddressUseCase: ChecksOMS {
    public static func updateAddress(ofID: UUID, in order: Order, with deliveryAddress: DeliveryAddress) async
        -> Result<Void, Error> {
        let areProductsInStock = areProducts(in: order, availableFor: deliveryAddress)
        guard areProductsInStock else { return .failure(OMSError.productOutOfStock) }

        return .success
    }

    public static func updateAddress(ofID: UUID, in user: User, with deliveryAddress: DeliveryAddress) async
        -> Result<Void, Error> {
        .success
    }
}

public struct RemoveAddressUseCase {
    @discardableResult
    public static func removeAddress(ofID: UUID, from: Order) async -> Result<Void, Error> {
        .success
    }
}
