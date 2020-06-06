//
//  DonationsMoreDetailsController+Layout.swift
//  SayTheirNames
//
//  Created by Leonard Chen on 6/5/20.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

// MARK: - UICollectionViewLayout
extension DonationsMoreDetailsController {
    static var donationMoreDetailsCVLayout: UICollectionViewLayout {
        let horizontalPadding: CGFloat = 27
        
        // UICollectionViewCompositionalLayout in a layout provider
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int,
            _ : NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            switch sectionIndex {
            // Title section layout
            case DonationSectionLayoutKind.title.rawValue:
                // Item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Group
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50.0))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 30.0, leading: horizontalPadding, bottom: 20.0, trailing: horizontalPadding)
                
                // Photo Supplementary View
                let photoViewSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(420))
                let photoView =
                    NSCollectionLayoutBoundarySupplementaryItem(layoutSize: photoViewSize,
                                                                elementKind: DonationsMoreDetailsController.photoSupplementaryView,
                                                                alignment: .top)
                
                // Button Supplementary View
                let buttonViewSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let buttonView =
                    NSCollectionLayoutBoundarySupplementaryItem(layoutSize: buttonViewSize,
                                                                elementKind: DonationsMoreDetailsController.donationButtonSupplementaryView,
                                                                alignment: .bottom)
                buttonView.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: horizontalPadding, bottom: 0.0, trailing: horizontalPadding)
                
                section.supplementariesFollowContentInsets = false
                section.boundarySupplementaryItems = [photoView, buttonView]
                
                return section
                
            // Description section layout
            case DonationSectionLayoutKind.description.rawValue:
                // Item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Group
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(500.0))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: horizontalPadding, bottom: 0.0, trailing: horizontalPadding)
                
                // Supplementary
                
                return section
                
            // Social Media Hashtags section layout
            case DonationSectionLayoutKind.socialMedia.rawValue:
                // Item
                let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(130.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Group
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(31.0))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: horizontalPadding, bottom: 0.0, trailing: horizontalPadding)
                
                // Supplementary
                
                return section
            
            default:
                // Item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Group
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(1.0))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0.0, leading: horizontalPadding, bottom: 0.0, trailing: horizontalPadding)

                return section
            }
        }
        
        return layout
    }
}