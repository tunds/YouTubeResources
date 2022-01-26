//
//  RoomHeaderView.swift
//  Clubhouse
//
//  Created by Tunde on 03/03/2021.
//

import SwiftUI

struct RoomHeaderView: View {
    
    enum RoomHeaderAction {
        case dismiss
    }
    
    typealias RoomHeaderActionHandler = (_ action: RoomHeaderAction) -> Void

    let handler: RoomHeaderActionHandler
    
    internal init(handler: @escaping RoomHeaderView.RoomHeaderActionHandler) {
        self.handler = handler
    }
    
    var body: some View {
        
        HStack(spacing: 28) {
            
            Button(action: {
                handler(.dismiss)
            }, label: {
                Label("All rooms", systemImage: "chevron.down")
                    .font(Font.Nunito.bold(size: 18))
            })

            Spacer()
            Image.document
                .font(Font.Nunito.bold(size: 24))
            Image.profile_pic
                .resizable()
                .frame(width: 32, height: 32)
                .cornerRadius(11)
        }
        .foregroundColor(Color.textBlack)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .padding(.horizontal, 15)
    }
}

struct RoomHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        RoomHeaderView { _ in }
    }
}
