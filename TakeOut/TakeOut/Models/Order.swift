//
//  Order.swift
//  TakeOut
//
//  Created by Dicky Ning on 12/5/24.
//


struct Order: Codable {
    let userID: Int
    let hallID: Int
    let totalPrice: Double
    let pickupTime: String?
}
