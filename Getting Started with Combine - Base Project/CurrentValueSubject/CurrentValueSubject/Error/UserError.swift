//
//  UserError.swift
//  CurrentValueSubject
//
//  Created by Tunde on 17/04/2021.
//

import Foundation

enum UserError: Error {
    case invalid
}

extension UserError {
    
    public var errorDescription: String {
        switch self {
        case .invalid:
            return "Form is invalid"
        }
    }
}
