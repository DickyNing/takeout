//
//  MockData.swift
//  TakeOut
//
//  Created by Dicky Ning on 12/5/24.
//


import Foundation

// MARK: - Dummy Data
struct MockData {
    static let diningHalls: [DiningHall] = [
        DiningHall(id: 1, name: "Central Hall", location: "Main Campus", openTime: "08:00", closeTime: "20:00"),
        DiningHall(id: 2, name: "West Hall", location: "West Campus", openTime: "09:00", closeTime: "22:00")
    ]
    
    static let menuItems: [MenuItem] = [
        MenuItem(id: 1, name: "Cheeseburger", description: "Juicy burger with cheese", price: 5.99),
        MenuItem(id: 2, name: "Pasta", description: "Creamy Alfredo pasta", price: 7.49)
    ]
    
    static let orders: [Order] = [
        Order(id: 1, userId: 1, hallId: 1, status: "Pending", totalPrice: 15.98, placedAt: "2023-12-05T15:30:00Z", pickupTime: nil)
    ]
}
