//
//  RegexItem.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 04/05/2021.
//

import Foundation

/**
 * Error enum
 */

enum ValidationError: Error {
    case custom(message: String)
}

/**
 * Struct for holding a form regex item
 */

struct RegexFormItem {
    let pattern: String
    let error: ValidationError
}

/**
 * Patterns
 */

enum RegexPatterns {
    static let emailChars = ".*[@].*"
    static let higherThanSixChars = "^.{6,}$"
    static let name = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
}

/**
 * struct for regex validation
 */

protocol ValidationManager {
    func validate(_ val: Any) throws
}

struct RegexValidationManagerImpl: ValidationManager {

    private let items: [RegexFormItem]
    
    init(_ items: [RegexFormItem]) {
        self.items = items
    }
    
    func validate(_ val: Any) throws {
        
        let val = (val as? String) ?? ""
        
        try items.forEach { regexItem in
            
            let regex = try? NSRegularExpression(pattern: regexItem.pattern)
            let range = NSRange(location: 0, length: val.count)
            if regex?.firstMatch(in: val, options: [], range: range) == nil {
                throw regexItem.error
            }
        }
    }
}

/**
 * struct for date validation
 */

struct DateValidationManagerImpl: ValidationManager {
    
    private let ageLimit: Int = 18
    
    func validate(_ val: Any) throws{
        
        guard let date = val as? Date else {
            throw ValidationError.custom(message: "Invalid Value passed")
        }
        
        if let calculatedYr = Calendar.current.dateComponents([.year], from: date, to: Date()).year,
           calculatedYr < ageLimit {
            throw ValidationError.custom(message: "User is below the age of 18")
        }
    }
}
