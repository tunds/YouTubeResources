//
//  UITableViewCell+ReuseCleanUp.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import UIKit

extension UICollectionViewCell {
    
    func removeViews() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
}
