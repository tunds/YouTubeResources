//
//  ContentView.swift
//  Combine Form Validation SwiftUI
//
//  Created by Tunde on 10/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var contentBuilder = FormContentBuilderImpl()
    
    var body: some View {
        ScrollView {

            LazyVGrid(columns: [GridItem(.flexible(minimum: 88))],
                      spacing: 20) {
                ForEach(contentBuilder.formContent) { component in
                    
                    switch component {
                    case is TextFormComponent:
                        TextFieldFormView(textComponent: component as! TextFormComponent)
                            .environmentObject(contentBuilder)
                    case is DateFormComponent:
                        DateFormView(dateComponent: component as! DateFormComponent)
                            .environmentObject(contentBuilder)

                    case is ButtonFormItem:
                        ButtonFormView(buttonComponent: component as! ButtonFormItem) { id in
                            switch id {
                            case .submit:
                                contentBuilder.validate()
                            default:
                                break
                            }
                        }
                    default:
                        EmptyView()
                    }
                }
            }
            .padding(.top, 50)
        }
        .padding(.horizontal, 8)
        .onChange(of: contentBuilder.state,
                  perform: { value in
                    switch value {
                    case .valid(let user):
                        print("Created new user: \(user)")
                    case .error(let message):
                        print("Failed: \(message)")
                    case .none:
                        break
                    }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
