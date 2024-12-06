//
//  OrderManager.swift
//  TakeOut
//
//  Created by Zoey Jin on 12/5/24.
//
import Foundation

class OrderManager {
    static let shared = OrderManager()
    
    private let ordersKey = "bookmarkedRecipes"
    private var orders: [MenuItem] = []
    
    private init() {
        loadOrders()
    }
    func addOrder(_ menuItem: MenuItem) {
        if !isOrdered(menuItem.id) {
            orders.append(menuItem)
            saveOrders()
        }
    }
    
    // Removes a food item from the order using its ID
    func removeOrder(_ menuItemId: Int) {
        orders.removeAll { $0.id == menuItemId }
        saveOrders() // Persist the updated order list
    }
    
    // Checks if a food item has already been ordered using its ID
    func isOrdered(_ menuItemId: Int) -> Bool {
        return orders.contains { $0.id == menuItemId }
    }
    
    // Returns the list of ordered food items
    func getOrders() -> [MenuItem] {
        return orders
    }
    
    // Saves the orders to UserDefaults
    private func saveOrders() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(orders) {
            UserDefaults.standard.set(encodedData, forKey: ordersKey)
        }
    }
    
    // Loads the saved orders from UserDefaults
    private func loadOrders() {
        let decoder = JSONDecoder()
        if let savedData = UserDefaults.standard.data(forKey: ordersKey),
           let savedOrders = try? decoder.decode([MenuItem].self, from: savedData) {
            orders = savedOrders
        }
    }
}
