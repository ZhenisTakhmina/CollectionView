
//
//  MainViewController.swift
//  maki-maki-ios
//
//  Created by Tami on 12.06.2023.
//

import UIKit
import SnapKit

final class RestaurantViewController: UIViewController {
    
    private let sections = MockData.shared.pagedata
    
    // MARK: - UI
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .blue
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(
            DishesCollectionViewCell.self,
            forCellWithReuseIdentifier: DishesCollectionViewCell.reuseID
        )
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .never
        return collectionView
    }()
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
             return UICollectionViewCompositionalLayout { section, _ in
                 // Item
                 let item = NSCollectionLayoutItem(
                     layoutSize: NSCollectionLayoutSize(
                        widthDimension: .fractionalWidth(0.5),
                        heightDimension: .fractionalHeight(1)
                     )
                 )
                 item.contentInsets.trailing = 30
                 item.contentInsets.bottom = 30

                 // Group
                 let group = NSCollectionLayoutGroup.horizontal(
                     layoutSize: NSCollectionLayoutSize(
                         widthDimension: .fractionalWidth(1),
                         heightDimension: .absolute(245)
                     ),
                     subitems: [item]
                 )

                 // Section
                 let section = NSCollectionLayoutSection(group: group)
                 section.contentInsets = NSDirectionalEdgeInsets(
                     top: 50,
                     leading: 16,
                     bottom: 40,
                     trailing: 0
                 )
//                 section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                 return section
             }
         }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - SetupViews
    private func setupViews() {
        self.edgesForExtendedLayout = []
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    // MARK: - SetupConstraints
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate methods
extension RestaurantViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource methods
extension RestaurantViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].items.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DishesCollectionViewCell.reuseID,
            for: indexPath
        ) as? DishesCollectionViewCell else {
            fatalError("Could not cast to DishesCollectionViewCell")
        }
        
        return cell
    }
}
