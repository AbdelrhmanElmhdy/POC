//
//  City.swift
//
//
//  Created by Abdelrhman Elmahdy on 30/07/2023.
//

import Foundation

public struct City: Codable {
    public let id: UUID
    public let name: String
    public let areas: [Area]
}
