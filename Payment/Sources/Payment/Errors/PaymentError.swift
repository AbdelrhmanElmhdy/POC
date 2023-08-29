//
//  OMSError.swift
//
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import BtechFoundation
import Foundation

struct OMSError: Error {
    static let productOutOfStock = OMSError(
        debugDescription: "Product Out Of Stock",
        userFriendlyDescription: "Product Out Of Stock"
    )

    static let productOutOfStock2 = OMSError(
        debugDescription: "Product Out Of Stock",
        userFriendlyDescription: "Product Out Of Stock"
    )

    static let productOutOfStock32 = OMSError(
        debugDescription: "Product Out Of Stock",
        userFriendlyDescription: "Product Out Of Stock"
    )

    let debugDescription: String
    let userFriendlyDescription: String
    let recoverySuggestion: String? = nil
}
