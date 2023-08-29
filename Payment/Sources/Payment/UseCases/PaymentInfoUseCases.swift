//
//  PaymentInfoUseCases.swift
//
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import Foundation
import BtechFoundation

public struct AddPaymentInfoUseCase {
    public static func add(_ paymentCard: PaymentCard) async -> Result<Void, Error> {
        return .success
    }
}
