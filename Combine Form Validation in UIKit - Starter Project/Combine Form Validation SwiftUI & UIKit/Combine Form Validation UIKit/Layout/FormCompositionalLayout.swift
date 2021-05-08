//
//  FormCompositionalLayout.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import UIKit

final class FormCompositionalLayout {
    
    var layout: UICollectionViewCompositionalLayout {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
    

        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let layoutGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .estimated(44)
        )
        
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: layoutGroupSize,
            subitem: layoutItem,
            count: 1
        )
        
        layoutGroup.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.contentInsets = .init(top: 150, leading: 0, bottom: 0, trailing: 0)
       
        let compLayout = UICollectionViewCompositionalLayout(section: layoutSection)
        
        return compLayout
    }
}

