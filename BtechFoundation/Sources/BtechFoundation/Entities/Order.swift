//
//  Order.swift
//
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import Foundation

public struct Order {
    let id = UUID()
    let cart: Cart
    var shippingInformation: ShippingInformation
    var paymentMethod: PaymentMethod
    var deliveryFee: Float

    var totalQuantity: Int { cart.totalQuantity }
    var totalPrice: Float { cart.totalPrice + deliveryFee }
}
