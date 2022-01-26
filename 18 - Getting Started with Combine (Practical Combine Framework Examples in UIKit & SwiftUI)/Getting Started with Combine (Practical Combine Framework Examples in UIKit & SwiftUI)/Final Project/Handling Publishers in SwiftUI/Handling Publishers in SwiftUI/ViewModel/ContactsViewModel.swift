//
//  ContactsViewModel.swift
//  Handling Publishers in SwiftUI
//
//  Created by Tunde on 19/04/2021.
//

import Combine

class ContactsViewModel: ObservableObject {
        
    @Published private(set) var contacts = [Contact]()
        
    func add(contact: Contact) {
        contacts.append(contact)
    }
}
