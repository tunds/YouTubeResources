//
//  FormItem.swift
//  Combine Form Validation SwiftUI
//
//  Created by Tunde on 10/05/2021.
//

import Foundation
import UIKit
import SwiftUI

/**
 * Implementation for a form item
 */

protocol FormItem {
    var id: UUID { get }
    var formId: FormField { get }
    var validations: [ValidationManager] { get }
    var val: Any? { get }
}

/**
 * Unique identifiers for form items
 */

enum FormField: String, CaseIterable {
    case firstName
    case lastName
    case email
    case dob
    case submit
}


/**
 * Component for a form items the form
 */

class FormComponent: FormItem, Identifiable {
    
    let id = UUID()
    let formId: FormField
    var validations: [ValidationManager]
    var val: Any?
    
    init(_ id: FormField,
         validations: [ValidationManager] = []) {
        self.formId = id
        self.validations = validations
    }
}

/**
 * Component for a text item in the form
 */

final class TextFormComponent: FormComponent {
   
    let placeholder: String
    let keyboardType: UIKeyboardType
 
    init(id: FormField,
        placeholder: String,
        keyboardType: UIKeyboardType = .default,
        validations: [ValidationManager] = []) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        super.init(id, validations: validations)
    }
}

/**
 * Component for a date item in the form
 */

final class DateFormComponent: FormComponent {

    let mode: UIDatePicker.Mode
    
    init(id: FormField,
         mode: UIDatePicker.Mode,
         validations: [ValidationManager] = []) {
        self.mode = mode
        super.init(id, validations: validations)
    }
}

/**
 * Component for a button item in the form
 */

final class ButtonFormItem: FormComponent {

    let title: String
    
    init(id: FormField,
         title: String) {
        self.title = title
        super.init(id)
    }
}
