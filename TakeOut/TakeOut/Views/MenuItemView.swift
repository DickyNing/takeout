//
//  MenuItemView.swift
//  TakeOut
//
//  Created by Zoey Jin on 12/5/24.
//
import UIKit
import SDWebImage

class MenuItemView: UICollectionViewCell {
    //MARK: - Properties
    static let identifier = "MenuItemView"
    
    private let itemImageView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private var priceLabel = UILabel()
    
    //MARK: - Set up views
    private func setupItemImageView() {
        itemImageView.contentMode = .scaleAspectFill
        itemImageView.clipsToBounds = true
        itemImageView.layer.cornerRadius = 12
        
        contentView.addSubview(itemImageView)
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // Recipe Image
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
            nameLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor,
                                           constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
    }
    
    private func setUpDescriptionLabel() {
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.textColor = .darkGray
        descriptionLabel.numberOfLines = 3
            
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
        descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    private func setUpPriceLabel() {
        priceLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        priceLabel.textColor = .systemGreen
        
        contentView.addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        ])
    }
    
   
 //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupItemImageView()
        setUpNameLabel()
        setUpDescriptionLabel()
        setUpPriceLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


