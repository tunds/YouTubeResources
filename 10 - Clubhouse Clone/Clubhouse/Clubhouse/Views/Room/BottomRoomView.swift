//
//  BottomRoomView.swift
//  Clubhouse
//
//  Created by Tunde on 04/03/2021.
//

import SwiftUI

struct BottomRoomView: View {

    enum BottomRoomAction {
        case leave
    }
    
    typealias BottomRoomActionHandler = (_ action: BottomRoomAction) -> Void

    let handler: BottomRoomActionHandler
    
    init(handler: @escaping BottomRoomView.BottomRoomActionHandler) {
        self.handler = handler
    }
    
    var body: some View {
        
        HStack(spacing: 22) {
            
            Button(action: {
                handler(.leave)
            }, label: {
                Text("✌🏾 Leave quietly")
                    .font(Font.Nunito.bold(size: 16))
                    .foregroundColor(Color.red)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 8)
                    .background(Color.customLightGray)
                    .cornerRadius(18)
            })
            
            Spacer()
            
            Image
                .plus
                .font(Font.Nunito.semiBold(size: 24))
                .padding(8)
                .background(Color.customLightGray)
                .clipShape(Circle())
            
            Image
                .handRaised
                .font(Font.Nunito.semiBold(size: 24))
                .padding(4)
                .background(Color.customLightGray)
                .clipShape(Circle())
            
        }
        .padding(.horizontal, 15)
        .padding(.top, 10)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               maxHeight: 100,
               alignment: .top)
        .background(Color.cardBackground)
    }
}

struct BottomRoomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomRoomView { _ in }
    }
}
