//
//  User.swift
//  
//
//  Created by Abdelrhman Elmahdy on 31/07/2023.
//

import Foundation

public struct User {
    public var id: UUID
    public var name: String
    public var email: String
    public var phoneNumber: String
    public var savedAddresses: [DeliveryAddress]
}
