//
//  UITableViewCell+ReuseCleanUp.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import UIKit

extension UICollectionViewCell {
    
    /// Removes all content within a cell to help with cleanup
    func removeViews() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}
