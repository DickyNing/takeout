//
//  CartManager.swift
//  TakeOut
//
//  Created by Zoey Jin on 12/5/24.
//

import Foundation
class CartManager {
    static let shared = CartManager()
    
    private let cartKey = "cartItems"
    private let ordersKey = "previousOrders"
    var cartItems: [MenuItem] = []
    private var orders: [[MenuItem]] = []
    
    private init() {
        loadCart()
        loadOrders()
    }
    
    func addToCart(_ item: MenuItem) {
        if !isInCart(item.id) {
            cartItems.append(item)
            saveCart()
        }
    }
    
    func removeFromCart(_ itemId: Int) {
        cartItems.removeAll { $0.id == itemId }
        saveCart()
    }
    func isInCart(_ itemId:Int) -> Bool {
         return cartItems.contains { $0.id == itemId }
     }
     
     func getCartItems() -> [MenuItem] {
         return cartItems
     }
     
     func checkout() {
         if !cartItems.isEmpty {
             orders.append(cartItems)
             cartItems.removeAll()
             saveCart()
             saveOrders()
         }
     }
     
     func getPreviousOrders() -> [[MenuItem]] {
         return orders
     }
    private func saveCart() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(cartItems) {
            UserDefaults.standard.set(encodedData, forKey: cartKey)
        }
    }
    
    private func loadCart() {
        let decoder = JSONDecoder()
        if let savedData = UserDefaults.standard.data(forKey: cartKey),
           let savedCart = try? decoder.decode([MenuItem].self, from: savedData) {
            cartItems = savedCart
        }
    }
    private func saveOrders() {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(orders) {
            UserDefaults.standard.set(encodedData, forKey: ordersKey)
        }
    }
    
    private func loadOrders() {
        let decoder = JSONDecoder()
        if let savedData = UserDefaults.standard.data(forKey: ordersKey),
           let savedOrders = try? decoder.decode([[MenuItem]].self, from: savedData) {
            orders = savedOrders
        }
    }
}
