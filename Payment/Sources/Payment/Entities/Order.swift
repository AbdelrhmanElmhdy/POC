//
//  File.swift
//  
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import Foundation

public struct Order {
    let productIDs: [UUID]
    let shippingInformation: ShippingInformation
    let totalPrice: Float
}
