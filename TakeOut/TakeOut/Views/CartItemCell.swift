//
//  CartItemCell.swift
//  TakeOut
//
//  Created by Zoey Jin on 12/6/24.
//
import UIKit

class CartItemCell: UITableViewCell {
    
    private let itemImageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    private let removeButton = UIButton()
    
    var itemId: Int?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Set up image view, labels, and remove button
        contentView.addSubview(itemImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(removeButton)
        
        // Setup constraints (e.g., for itemImageView, nameLabel, priceLabel, removeButton)
        setUpConstraints()
        
        removeButton.addTarget(self, action: #selector(handleRemoveTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with item: MenuItem) {
        itemImageView.sd_setImage(with: URL(string: item.imageUrl))
        nameLabel.text = item.name
        priceLabel.text = "Price: $\(item.price)"
        itemId = item.id
        
        removeButton.setTitle("Remove", for: .normal)
        removeButton.backgroundColor = .systemRed
        removeButton.layer.cornerRadius = 8
    }
    
    @objc private func handleRemoveTapped() {
        guard let itemId = itemId else { return }
        
        CartManager.shared.removeFromCart(itemId)
        // Reload the table to reflect the updated cart
        (self.superview as? UITableView)?.reloadData()
    }
    
    private func setUpConstraints() {
        // Add constraints for the image view, labels, and remove button (use AutoLayout or frame-based layout)
    }
}

