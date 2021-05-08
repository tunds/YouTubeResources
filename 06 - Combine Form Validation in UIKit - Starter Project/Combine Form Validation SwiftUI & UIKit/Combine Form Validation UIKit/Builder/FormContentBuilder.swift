//
//  FormContentBuilder.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import Foundation

final class FormContentBuilderImpl {
        
    private(set) var formContent = [
            FormSectionComponent(items: [
                TextFormComponent(id: .firstName,
                                  placeholder: "First Name"),
                TextFormComponent(id: .lastName,
                                  placeholder: "Last Name"),
                TextFormComponent(id: .email,
                                  placeholder: "Email",
                                  keyboardType: .emailAddress),
                DateFormComponent(id: .dob,
                                  mode: .date),
                ButtonFormItem(id: .submit,
                               title: "Confirm")
            ])
        ]
}
