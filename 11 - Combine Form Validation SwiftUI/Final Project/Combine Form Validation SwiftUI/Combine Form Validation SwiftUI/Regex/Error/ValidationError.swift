//
//  ValidationError.swift
//  Combine Form Validation UIKit
//
//  Created by Tunde on 09/05/2021.
//

import Foundation

enum ValidationError: Error {
    case custom(message: String)
}

extension ValidationError {
    
    var errorDescription: String {
        switch self {
        case .custom(let message):
            return message
        }
    }
}
