//
//  FeedRoomView.swift
//  Clubhouse
//
//  Created by Tunde on 01/03/2021.
//

import SwiftUI

struct FeedRoomView: View {
    
    let room: FeedRoom
    private let size: CGFloat = 38
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if let groupName = room.groupName {
                HStack(spacing: 3) {
                    Text(groupName.uppercased())
                        .font(Font.Nunito.bold(size: 10))
                        .foregroundColor(Color.textBlack)
                    Image
                        .home
                        .font(Font.Nunito.bold(size: 10))
                        .foregroundColor(Color.customGreen)
                }
            }
            Text(room.roomName)
                .font(Font.Nunito.bold(size: 16))
                .foregroundColor(Color.textBlack)
            
            HStack(alignment: .top) {
                if room.hostPics.count > 1 {
                    Image(room.hostPics.first!)
                        .resizable()
                        .frame(width: size, height: size)
                        .cornerRadius(14)
                        .overlay(Image(room.hostPics.last!)
                                    .resizable()
                                    .frame(width: size, height: size)
                                    .cornerRadius(14)
                                    .offset(x: size / 2, y: size / 2))
                } else {
                    Image(room.hostPics.first!)
                        .resizable()
                        .frame(width: size, height: size)
                        .cornerRadius(14)
                }

                VStack(alignment: .leading, spacing: 3) {
                    ForEach(room.participants, id: \.self) {
                        Text("\($0) 💬")
                    }
                    .font(Font.Nunito.bold(size: 16))
                    .foregroundColor(Color.textBlack)
                    
                    HStack(alignment: .center, spacing: 0) {
                        Text(room.numOfParticipants.description)
                            .padding(.trailing, 5)
                        Image.person
                        Text("/")
                            .padding(.horizontal, 5)
                        Text(room.numOfHosts.description)
                            .padding(.trailing, 5)
                        Image.chatBubble
                    }
                    .font(Font.Nunito.semiBold(size: 14))
                    .foregroundColor(Color.customGrey)
                }
                .padding(.leading, 30)
            }
        }
        .padding(.vertical, 17)
        .padding(.horizontal, 20)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .background(Color.cardBackground)
        .cornerRadius(19)
        .shadow(color: Color.cardShadowTint, radius: 1, x: 0, y: 1)
        .padding(.horizontal, 15)
    }
}

struct FeedRoomView_Previews: PreviewProvider {
    static var previews: some View {
        FeedRoomView(room: FeedRoom.dummyData[2])
            .preferredColorScheme(.dark)
    }
}
