//
//  OrderRequest.swift
//  TakeOut
//
//  Created by Dicky Ning on 12/5/24.
//


struct OrderRequest: Codable {
    let userId: Int
    let hallId: Int
    let totalPrice: Double
    let pickupTime: String? // Optional
}
