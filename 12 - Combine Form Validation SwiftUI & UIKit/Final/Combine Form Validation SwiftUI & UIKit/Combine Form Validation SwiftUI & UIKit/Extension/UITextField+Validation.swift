//
//  UITextField+Validation.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 05/05/2021.
//

import UIKit

extension UITextField {
    
    func valid() {
        self.layer.borderColor = UIColor.systemGreen.cgColor
    }
    
    func invalid() {
        self.layer.borderColor = UIColor.systemRed.cgColor
    }
}
