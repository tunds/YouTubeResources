//
//  FormContentBuilder.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import Foundation
import Combine

struct User: Equatable {
    let firstName: String
    let lastName: String
    let email: String
    let dob: Date
}

enum FormState {

    case valid(user: User)
    case error(custom: ValidationError)
}

extension FormState: Equatable {
    
    static func == (lhs: FormState, rhs: FormState) -> Bool {
        switch (lhs, rhs) {
        case (.valid(user: let lhsType),
              .valid(user: let rhsType)):
            return lhsType == rhsType
        case (.error(custom: let lhsType),
              .error(custom: let rhsType)):
            return lhsType.errorDescription == rhsType.errorDescription
        default:
            return false
        }
    }
}

final class FormContentBuilderImpl: ObservableObject {
    
    @Published private(set) var state: FormState?
    
    private(set) var formContent: [FormComponent] = [
        
           TextFormComponent(id: .firstName,
                             placeholder: "First Name",
                             validations: [

                               RegexValidationManagerImpl(
                                   [
                                       RegexFormItem(pattern: RegexPatterns.name,
                                                     error: .custom(message: "Invalid First Name entered"))
                                   ]
                               )

                             ]),
           TextFormComponent(id: .lastName,
                             placeholder: "Last Name",
                             validations: [

                                RegexValidationManagerImpl(
                                   [
                                       RegexFormItem(pattern: RegexPatterns.name,
                                                     error: .custom(message: "Invalid Last Name entered"))
                                   ]
                               )

                             ]),
           TextFormComponent(id: .email,
                             placeholder: "Email",
                             keyboardType: .emailAddress,
                             validations: [

                                RegexValidationManagerImpl(
                                   [
                                       RegexFormItem(pattern: RegexPatterns.emailChars,
                                                     error: .custom(message: "Invalid Email missing @")),
                                       RegexFormItem(pattern: RegexPatterns.higherThanSixChars,
                                                     error: .custom(message: "Less than 6 characters"))
                                   ]
                               )


                             ]),
           DateFormComponent(id: .dob,
                             mode: .date,
                             validations: [

               DateValidationManagerImpl()
           ]),
           ButtonFormItem(id: .submit,
                          title: "Confirm")
    ]

    func update(val: Any, in component: FormComponent) {
        
        guard let index = formContent.firstIndex(where: { $0.id == component.id }) else { return }
        formContent[index].val = val
    }
    
    func validate() {
        
        let formComponents = formContent
            .filter { $0.formId != .submit }
        
        for component in formComponents {
            
            for validator in component.validations {
                
                if let error = validator.validate(component.val as Any) {
                    self.state = .error(custom: error)
                    return
                }
            }
        }
        
        if let firstName = formComponents.first(where: { $0.formId == .firstName })?.val as? String,
           let lastName = formComponents.first(where: { $0.formId == .lastName })?.val as? String,
           let email = formComponents.first(where: { $0.formId == .email })?.val as? String,
           let dob = formComponents.first(where: { $0.formId == .dob })?.val as? Date {
            
            let newUser = User(firstName: firstName,
                               lastName: lastName,
                               email: email,
                               dob: dob)
            
            self.state = .valid(user: newUser)
        }
    }
}
