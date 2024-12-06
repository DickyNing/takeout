//
//  MenuItem.swift
//  HackApp
//
//  Created by Zoey Jin on 12/6/24.
//

import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var price: Int
    
}

//Dummy Data
var itemList = [MenuItem(name: "Pasta: with tomatoes", image: "food1", price: 10),
                   MenuItem(name: "Item Two", image: "food2", price: 6),
                   MenuItem(name: "Item Three", image: "food3", price: 16),
                   MenuItem(name: "Item Four", image: "food4", price: 7),
                   MenuItem(name: "Item Five", image: "food5", price: 3),
                   MenuItem(name: "Item Six", image: "food6", price: 1),
                   MenuItem(name: "Item Seven", image: "food7", price: 2),
                   MenuItem(name: "Item Eight", image: "food8", price: 23)]
