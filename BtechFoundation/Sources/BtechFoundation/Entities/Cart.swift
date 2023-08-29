//
//  Cart.swift
//
//
//  Created by Abdelrhman Elmahdy on 01/08/2023.
//

import Foundation

public struct Cart {
    public struct Item {
        let id = UUID()
        let name: String
        let thumbnailImage: URL
        let price: Float
        let isBtechProduct: Bool
        var quantity: Int
    }

    public let id = UUID()
    public private(set) var items: [Item]

    public var totalQuantity: Int {
        items.reduce(0) { $0 + $1.quantity }
    }

    public var totalPrice: Float {
        items.reduce(0) { $0 + ($1.price * Float($1.quantity)) }
    }

    public mutating func addItem(_ item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].quantity += item.quantity
        } else {
            items.append(item)
        }
    }

    public mutating func removeItem(withID id: UUID) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items.remove(at: index)
        }
    }

    public mutating func updateQuantity(ofItemWithID id: UUID, to quantity: Int) {
        if let index = items.firstIndex(where: { $0.id == id }) {
            items[index].quantity = quantity
        }
    }

    public mutating func clearCart() {
        items.removeAll()
    }
}
