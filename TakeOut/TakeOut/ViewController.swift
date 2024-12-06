//
//  ViewController.swift
//  TakeOut
//
//  Created by Zoey Jin on 12/5/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    private var collectionView: UICollectionView!
    private var items: [MenuItem] = [] // Replace with actual data source
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Food Available Today"
        view.backgroundColor = .white
        setUpCollectionView()
        loadItems()
        
        //Set up cart button
        let cartButton = UIBarButtonItem(title: "My Cart", style: .plain, target: self, action: #selector(openCart))
        navigationItem.rightBarButtonItem = cartButton
    }
    
    private func setUpCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 32, height: 200)
        layout.minimumLineSpacing = 24
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(MenuItemCollectionView.self, forCellWithReuseIdentifier: MenuItemCollectionView.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    private func loadItems() {
        // Replace this with actual data fetching logic
        items = [
            MenuItem(id: 1, name: "Sample Item 1", price: 19.99, imageUrl: "https://via.placeholder.com/150"),
            MenuItem(id: 2, name: "Sample Item 2", price: 29.99, imageUrl: "https://via.placeholder.com/150"),
        ]
        collectionView.reloadData()
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuItemCollectionView.identifier, for: indexPath) as? MenuItemCollectionView else {
            return UICollectionViewCell()
        }
        let item = items[indexPath.item]
        let isInCart = CartManager.shared.isInCart(item.id)
        cell.configure(with: item, isInCart: isInCart)
        cell.contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCellTap(_:))))
        return cell
    }
    @objc private func openCart() {
        let cartVC = CartViewController()
        navigationController?.pushViewController(cartVC, animated: true)
    }
    
    @objc private func handleCellTap(_ sender: UITapGestureRecognizer) {
        guard let cell = sender.view as? MenuItemCollectionView,
              let indexPath = collectionView.indexPath(for: cell) else {
            return
        }
        let item = items[indexPath.item]
        if CartManager.shared.isInCart(item.id) {
            CartManager.shared.removeFromCart(item.id)
        } else {
            CartManager.shared.addToCart(item)
        }
        collectionView.reloadItems(at: [indexPath])
    }
}

