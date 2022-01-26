//
//  ContactView.swift
//  Handling Publishers in SwiftUI
//
//  Created by Tunde on 19/04/2021.
//

import SwiftUI

struct ContactView: View {
    
    let contact: Contact
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 8) {
            Text(contact.name)
                .font(.system(size: 24,
                              weight: .bold))
            Text(contact.occupation)
                .font(.system(size: 14,
                              weight: .regular))
            Text(contact.number)
                .font(.system(size: 16,
                              weight: .semibold))
            
        }
        .padding(16)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                alignment: .leading)
        .background(Color.init(UIColor.systemGray6))
        .cornerRadius(8)
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView(contact: .init(name: "tundsdev",
                                   occupation: "iOS Developer",
                                   number: "+(44)0700000000"))
    }
}
