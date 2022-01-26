//
//  FormContentBuilder.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import Foundation

final class FormContentBuilderImpl {
    
    var content: [FormSectionComponent] {
        
        return [
            FormSectionComponent(items: [
                TextFormComponent(placeholder: "First Name"),
                TextFormComponent(placeholder: "Last Name"),
                TextFormComponent(placeholder: "Email",
                             keyboardType: .emailAddress),
                DateFormComponent(mode: .date),
                ButtonFormItem(title: "Confirm")
            ])
        ]
    }
}
