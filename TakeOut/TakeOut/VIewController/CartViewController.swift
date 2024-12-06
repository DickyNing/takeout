//
//  CartViewController.swift
//  TakeOut
//
//  Created by Zoey Jin on 12/6/24.
//
import UIKit

class CartViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Table view to display the cart items
    private var tableView: UITableView!
    
    // Cart items (using CartManager to get them)
    private var cartItems: [MenuItem] {
        return CartManager.shared.getCartItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Your Cart"
        
        // Set up table view
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartItemCell.self, forCellReuseIdentifier: "CartItemCell")
        tableView.tableFooterView = UIView()
        
        view.addSubview(tableView)
    }
    
    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartItemCell", for: indexPath) as! CartItemCell
        let item = cartItems[indexPath.row]
        cell.configure(with: item)
        return cell
    }
    
    // MARK: - Table View Delegate (for remove action)
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // You could navigate to a detailed view of the item if needed
    }
}
