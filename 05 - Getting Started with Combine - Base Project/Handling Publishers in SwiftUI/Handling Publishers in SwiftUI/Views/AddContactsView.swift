//
//  AddContactsView.swift
//  Handling Publishers in SwiftUI
//
//  Created by Tunde on 19/04/2021.
//

import SwiftUI

struct AddContactsView: View {
    
    @Binding var isPresented: Bool
    @State var newContact = Contact(name: "",
                                    occupation: "",
                                    number: "")
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Info")) {
                    
                    TextField("Name",
                              text: $newContact.name)
                    
                    TextField("Occupation",
                              text: $newContact.occupation)
                    
                    TextField("Number",
                              text: $newContact.number)
                }
            }
            .navigationTitle("Add New Contact")
            .navigationBarItems(leading: Button(action: {
                isPresented = false
            }, label: {
                Text("Cancel")
            }), trailing: Button(action: {
                isPresented = false
            }, label: {
                Text("Add")
            }))
        }
    }
}

struct AddContactsView_Previews: PreviewProvider {
    static var previews: some View {
        AddContactsView(isPresented: .constant(false))
    }
}
