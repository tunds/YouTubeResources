//
//  TextFieldFormView.swift
//  Combine Form Validation SwiftUI
//
//  Created by Tunde on 10/05/2021.
//

import SwiftUI

struct TextFieldFormView: View {
    
    // Inject the model here
    @EnvironmentObject var contentBuilder: FormContentBuilderImpl
    @State private var text = ""
    @State private var validationError: ValidationError?
    
    let textComponent: TextFormComponent
    
    var body: some View {
        
        VStack(alignment: .leading) {
            TextField(textComponent.placeholder, text: $text)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                       minHeight: 44,
                       alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .padding(.leading, 5)
                .keyboardType(textComponent.keyboardType)
                .background(
                    RoundedRectangle(cornerRadius: 10,
                                     style: .continuous)
                        .stroke(validationError != nil ? Color.red : Color.gray.opacity(0.25), lineWidth: 1))
                
                .onChange(of: text, perform: { value in
                    
                    // Perform the validation and change the state of a variablke
                    validationError = textComponent
                        .validations
                        .compactMap { $0.validate(text) }
                        .first
                
                    contentBuilder.update(val: text, in: textComponent)
                    
                    print("Changed: \(text)")
                    print(validationError)
                })
            Text(validationError?.errorDescription ?? "")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color.red)
        }
    }
}

struct TextFormView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldFormView(textComponent: .init(id: .email,
                                               placeholder: ""))
            .environmentObject(FormContentBuilderImpl())
            .padding(.horizontal, 8)
    }
}
