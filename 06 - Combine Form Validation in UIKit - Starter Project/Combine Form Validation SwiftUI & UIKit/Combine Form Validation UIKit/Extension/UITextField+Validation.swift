//
//  UITextField+Validation.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 05/05/2021.
//

import UIKit

extension UITextField {
    
    /// Highlights a textfield in green to show that it's valid
    func valid() {
        self.layer.borderColor = UIColor.systemGreen.cgColor
    }
    
    /// Highlights a textfield in red to show that it's invalid
    func invalid() {
        self.layer.borderColor = UIColor.systemRed.cgColor
    }
}
