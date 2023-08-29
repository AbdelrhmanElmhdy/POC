//
//  ShippingInformation.swift
//
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import Foundation

public struct ShippingInformation {
    public enum ShippingMethod {
        case homeDelivery(DeliveryAddress)
        case storePickup(PickupStore)
    }

    public let customerName: String
    public let customerPhoneNumber: String
    public let customerEmail: String?
    public let selectedShippingMethod: ShippingMethod
}
