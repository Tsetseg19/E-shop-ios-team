//
//  Untitled.swift
//  Shopping
//
//  Created by Enkhtsetseg Unurbayar on 2/10/25.
//

import Foundation

struct ShoppingCartItem: Identifiable, Codable {
    let id: String
    let name: String
    let price: String
    let imageURL: String
    let stars: Int
    let description: String
}
