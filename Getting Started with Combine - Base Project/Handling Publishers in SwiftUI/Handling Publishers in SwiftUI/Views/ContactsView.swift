//
//  ContactsView.swift
//  Handling Publishers in SwiftUI
//
//  Created by Tunde on 19/04/2021.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Text("No Contacts")
                    .font(.system(size: 16,
                                  weight: .bold))
                Text("It seems that there are no contacts, why don't you add some above")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 13,
                                  weight: .regular))
                    .padding(.horizontal, 16)
                    .padding(.top, 4)
                
            }
            .navigationTitle("Contacts")
            .navigationBarItems(trailing: Button(action: {
                isPresented = true
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $isPresented,
                   content: {
                    AddContactsView(isPresented: $isPresented)
            })
        }
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
