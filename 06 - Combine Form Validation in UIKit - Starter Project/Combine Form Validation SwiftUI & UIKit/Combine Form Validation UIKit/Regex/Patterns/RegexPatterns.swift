//
//  RegexPatterns.swift
//  Combine Form Validation UIKit
//
//  Created by Tunde on 08/05/2021.
//

/**
 * Patterns we will use to validate our content
 */

enum RegexPatterns {
    static let emailChars = ".*[@].*"
    static let higherThanSixChars = "^.{6,}$"
    static let name = "^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$"
}
