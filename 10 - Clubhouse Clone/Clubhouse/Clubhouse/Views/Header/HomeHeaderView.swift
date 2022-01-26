//
//  HomeHeaderView.swift
//  Clubhouse
//
//  Created by Tunde on 28/02/2021.
//

import SwiftUI

struct HomeHeaderView: View {
    
    enum HeaderViewActions {
        case profile
    }
    
    typealias ProfileActionHandler = (_ action: HeaderViewActions) -> Void
    
    let handler: ProfileActionHandler
    
    internal init(handler: @escaping HomeHeaderView.ProfileActionHandler) {
        self.handler = handler
    }
    
    var body: some View {
        HStack(spacing: 28) {
            Image.search
            Spacer()
            Image.invite
            Image.calendar
            Image.notificationBell
            Button(action: {
                handler(.profile)
            }, label: {
                Image.profile_pic
                    .resizable()
                    .frame(width: 32, height: 32)
                    .cornerRadius(11)
            })
        }
        .font(Font.Nunito.bold(size: 24))
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(.horizontal, 15)
    }
}

struct HomeHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHeaderView { _ in }
            .previewLayout(.sizeThatFits)
    }
}
