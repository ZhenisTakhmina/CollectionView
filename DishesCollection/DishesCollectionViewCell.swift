//
//  DishesCollectionViewCell.swift
//  DishesCollection
//
//  Created by Tami on 13.06.2023.
//

import UIKit

class DishesCollectionViewCell: UICollectionViewCell {
    static let reuseID = String(describing: DishesCollectionViewCell.self)

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .yellow
        contentView.layer.cornerRadius = 14
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
