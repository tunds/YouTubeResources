//
//  DateFormView.swift
//  Combine Form Validation SwiftUI
//
//  Created by Tunde on 10/05/2021.
//

import SwiftUI

struct DateFormView: View {
    
    @EnvironmentObject var contentBuilder: FormContentBuilderImpl
    @State private var selectedDate = Date()
    @State private var validationError: ValidationError?
    
    let dateComponent: DateFormComponent
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                DatePicker("",
                           selection: $selectedDate,
                       displayedComponents: [.date])
                    .labelsHidden()
                    .fixedSize()
                    .onChange(of: selectedDate, perform: { value in
                        
                        validationError = dateComponent
                            .validations
                            .compactMap { $0.validate(selectedDate) }
                            .first
                    
                        contentBuilder.update(val: selectedDate, in: dateComponent)
                    })
                Spacer()
            }
            
            Text(validationError != nil ? validationError!.errorDescription : "")
                .font(.system(size: 12, weight: .semibold))
                .foregroundColor(Color.red)
        }
    }
}

struct DateFormView_Previews: PreviewProvider {
    static var previews: some View {
        DateFormView(dateComponent: .init(id: .dob, mode: .date))
            .environmentObject(FormContentBuilderImpl())
    }
}
