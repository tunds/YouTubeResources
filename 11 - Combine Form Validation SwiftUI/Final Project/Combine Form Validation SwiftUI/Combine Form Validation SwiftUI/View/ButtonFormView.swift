//
//  ButtonFormView.swift
//  Combine Form Validation SwiftUI
//
//  Created by Tunde on 10/05/2021.
//

import SwiftUI

struct ButtonFormView: View {

    typealias ButtonFormAction = (_ id: FormField) -> Void
    
    // Inject object here
    
    let buttonComponent: ButtonFormItem
    
    private let handler: ButtonFormAction
    
    init(buttonComponent: ButtonFormItem,
                  handler: @escaping ButtonFormView.ButtonFormAction) {
        self.buttonComponent = buttonComponent
        self.handler = handler
    }
    
    var body: some View {
        Button(buttonComponent.title) {
            handler(buttonComponent.formId)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               minHeight: 44,
               alignment: .center)
        .background(Color.blue)
        .foregroundColor(.white)
        .font(.system(size: 16, weight: .bold))
        .cornerRadius(8)
    }
}

struct ButtonFormView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonFormView(buttonComponent: .init(id: .submit, title: "Confirm")) { _ in }
    }
}
