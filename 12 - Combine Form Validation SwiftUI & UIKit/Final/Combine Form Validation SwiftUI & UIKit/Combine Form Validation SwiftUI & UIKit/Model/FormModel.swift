//
//  FormModel.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import UIKit

protocol FormItem {
    var id: UUID { get }
    var formId: FormField { get }
    var validations: [ValidationManager] { get }
}

protocol FormSectionItem {
    var id: UUID { get }
    var items: [FormComponent] { get }
    init(items: [FormComponent])
}

enum FormField: String, CaseIterable {
    case firstName
    case lastName
    case email
    case dob
    case submit
}

/**
 * Component for a form section the form
 */

final class FormSectionComponent: FormSectionItem, Hashable {

    let id: UUID = UUID()
    var items: [FormComponent]

    required init(items: [FormComponent]) {
        self.items = items
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
  
    static func == (lhs: FormSectionComponent, rhs: FormSectionComponent) -> Bool {
        lhs.id == rhs.id
    }
}

/**
 * Component for a form items the form
 */

class FormComponent: FormItem, Hashable {

    let id = UUID()
    let formId: FormField
    var validations: [ValidationManager]
    var value: Any?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FormComponent, rhs: FormComponent) -> Bool {
        lhs.id == rhs.id
    }
    
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
