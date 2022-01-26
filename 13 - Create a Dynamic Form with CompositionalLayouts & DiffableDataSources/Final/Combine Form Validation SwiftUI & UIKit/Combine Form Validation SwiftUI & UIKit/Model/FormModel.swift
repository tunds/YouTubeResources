//
//  FormModel.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import UIKit

protocol FormItem {
    var id: UUID { get }
}

protocol FormSectionItem {
    var id: UUID { get }
    var items: [FormComponent] { get }
    init(items: [FormComponent])
}

/**
 * Component for a form section the form
 */

final class FormSectionComponent: FormSectionItem, Hashable {

    var id: UUID = UUID()
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: FormComponent, rhs: FormComponent) -> Bool {
        lhs.id == rhs.id
    }
}

/**
 * Component for a text item in the form
 */

final class TextFormComponent: FormComponent {
   
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    init(placeholder: String,
        keyboardType: UIKeyboardType = .default) {
        self.placeholder = placeholder
        self.keyboardType = keyboardType
    }
}

/**
 * Component for a date item in the form
 */

final class DateFormComponent: FormComponent {

    let mode: UIDatePicker.Mode
    
    init(mode: UIDatePicker.Mode) {
        self.mode = mode
    }
}

/**
 * Component for a button item in the form
 */

final class ButtonFormItem: FormComponent {

    let title: String
    
    init(title: String) {
        self.title = title
    }
}
