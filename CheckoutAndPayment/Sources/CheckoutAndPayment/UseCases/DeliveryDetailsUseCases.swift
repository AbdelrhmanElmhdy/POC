//
//  DeliveryDetailsUseCases.swift
//
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import BtechFoundation
import Foundation
import Networking

public struct CheckStockUseCase {
    // carts/mine/oms-outofstock

    public static func areCartProductsInStock(cartID: UUID, in: Area) async -> Result<Bool, Error> {
        .success(true)
    }
}

public struct GetDeliveryDateUseCase {
    // oms/checkout/getdelivery

    static func getDeliveryDate(for: Order) -> Result<Bool, Error> {
        .success(true)
    }
}

public struct GetSavedAddressesUseCase {
    public static func getAllSavedAddresses(in area: Area) async -> Result<[DeliveryAddress], NetworkRequestError> {
        await config.userRepo.getAllSavedAddresses(in: area)
    }
}

public struct GetPickupStoresUseCase {
    // oms/checkout/getstores/
}

public struct EstimateShippingMethodsUseCase {
    // carts/mine/estimate-shipping-methods-per-item
}

public struct GetCitiesUseCase {
    public static func getCities() async -> Result<[City], NetworkRequestError> {
        await config.cityRepo.getAllCities()
    }

    public static func getCities(completion: @escaping ([City]?, NetworkRequestError?) -> Void) {
        config.cityRepo.getAllCities(completion: completion)
    }
}

public struct AddAddressUseCase {
    public static func add(_ deliveryAddress: DeliveryAddress, to order: Order) async -> Result<Void, Error> {
        .success
    }

    public static func add(_ deliveryAddress: DeliveryAddress, to user: User) async -> Result<Void, Error> {
        .success
    }
}

public struct UpdateAddressUseCase {
    public static func updateAddress(ofID: UUID, in order: Order, with deliveryAddress: DeliveryAddress) async
        -> Result<Void, Error> {
        .success
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


public struct AddressUseCases {
    @discardableResult
    public static func removeAddress(ofID: UUID, from: Order) async -> Result<Void, Error> {
        .success
    }
    
    public static func updateAddress(ofID: UUID, in order: Order, with deliveryAddress: DeliveryAddress) async
        -> Result<Void, Error> {
        .success
    }

    public static func updateAddress(ofID: UUID, in user: User, with deliveryAddress: DeliveryAddress) async
        -> Result<Void, Error> {
        .success
    }
    
    public static func getCities() async -> Result<[City], NetworkRequestError> {
        await config.cityRepo.getAllCities()
    }
    
    public static func getAllSavedAddresses(in area: Area) async -> Result<[DeliveryAddress], NetworkRequestError> {
        await config.userRepo.getAllSavedAddresses(in: area)
    }
}
