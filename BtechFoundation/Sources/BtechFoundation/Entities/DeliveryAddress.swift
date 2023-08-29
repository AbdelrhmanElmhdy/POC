//
//  File.swift
//
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import Foundation

public struct DeliveryAddress: Identifiable, Codable {
    public let id: UUID
    public let streetName: String
    public let city: City
    public let area: Area
    public let addressLabel: String

    public init(streetName: String, city: City, area: Area, addressLabel: String) {
        id = UUID()
        self.streetName = streetName
        self.city = city
        self.area = area
        self.addressLabel = addressLabel
    }
}
