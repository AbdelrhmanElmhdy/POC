//
//  PaymentCard.swift
//  
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import Foundation

public struct PaymentCard {
    let cardNumber: String
    let cardHolderName: String
    let expirationDate: ExpirationDate
    let cvv: String
}

public extension PaymentCard {
    struct ExpirationDate {
        let month: String
        let year: String
    }
}
