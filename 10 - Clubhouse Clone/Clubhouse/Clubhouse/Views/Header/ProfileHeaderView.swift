//
//  ProfileHeaderView.swift
//  Clubhouse
//
//  Created by Tunde on 02/03/2021.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    enum ProfileHeaderActions {
        case back
    }
    
    typealias ProfileBackHandler = (_ action: ProfileHeaderActions) -> Void
    
    let handler: ProfileBackHandler
    
    internal init(handler: @escaping ProfileHeaderView.ProfileBackHandler) {
        self.handler = handler
    }
    
    var body: some View {
        HStack(spacing: 28) {
            Button(action: {
                handler(.back)
            }, label: {
                Image.back
            })
            Spacer()
            Text("@")
            Image.gear
        }
        .foregroundColor(Color.textBlack)
        .font(Font.Nunito.bold(size: 24))
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(.horizontal, 15)
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView { _ in }
            .previewLayout(.sizeThatFits)
    }
}
