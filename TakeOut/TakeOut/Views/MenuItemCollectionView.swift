//
//  CartCollectionView.swift
//  TakeOut
//
//  Created by Zoey Jin on 12/5/24.
//
import UIKit
import SDWebImage

class MenuItemCollectionView: UICollectionViewCell {
    // MARK: - Properties
    static let identifier = "MenuItemCollectionView"
    
    private let itemImageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let addToCartButton = UIButton()
    
    var menuItem: MenuItem?
    
    // MARK: - Set up views
    private func setUpItemImageView() {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.clipsToBounds = true
        itemImageView.layer.cornerRadius = 12
        
        contentView.addSubview(itemImageView)
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    private func setUpNameLabel() {
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 2
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    private func setUpPriceLabel() {
        priceLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        priceLabel.textColor = .gray
        
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
    private func setUpAddToCartButton() {
        addToCartButton.setTitle("Add to Cart", for: .normal)
        addToCartButton.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        addToCartButton.backgroundColor = UIColor.systemOrange
        addToCartButton.setTitleColor(.white, for: .normal)
        addToCartButton.layer.cornerRadius = 8
        
        contentView.addSubview(addToCartButton)
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addToCartButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            addToCartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            addToCartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            addToCartButton.heightAnchor.constraint(equalToConstant: 40),
//            addToCartButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4)
        ])
    }
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpItemImageView()
        setUpNameLabel()
        setUpPriceLabel()
        setUpAddToCartButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Button Action
     @objc private func handleAddToCartButtonTapped() {
         guard let item = menuItem else { return }

         if CartManager.shared.isInCart(item.id) {
             // If the item is already in the cart, remove it
             CartManager.shared.removeFromCart(item.id)
             addToCartButton.setTitle("Add to Cart", for: .normal)
             addToCartButton.backgroundColor = .systemOrange
         } else {
             // If the item is not in the cart, add it
             CartManager.shared.addToCart(item)
             addToCartButton.setTitle("Remove from Cart", for: .normal)
             addToCartButton.backgroundColor = .systemRed
         }
     }
    
    // MARK: - Configure
    func configure(with menuItem: MenuItem, isInCart: Bool) {
        itemImageView.sd_setImage(with: URL(string: menuItem.imageUrl))
        nameLabel.text = menuItem.name
        priceLabel.text = "Price: $\(menuItem.price)"
        
        let buttonTitle = isInCart ? "Remove from Cart" : "Add to Cart"
        addToCartButton.setTitle(buttonTitle, for: .normal)
        addToCartButton.backgroundColor = isInCart ? UIColor.systemRed : UIColor.systemOrange
    }
    
}
