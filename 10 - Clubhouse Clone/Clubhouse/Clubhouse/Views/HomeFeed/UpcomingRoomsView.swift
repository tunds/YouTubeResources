//
//  UpcomingRoomsView.swift
//  Clubhouse
//
//  Created by Tunde on 28/02/2021.
//

import SwiftUI

// MARK: - UPCOMING ROOM
struct UpcomingRoomsView: View {
    
    let upcomingRooms: [UpcomingRoom]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(upcomingRooms) { room in
                GroupRoomsView(room: room)
            }
        }
        .padding(.vertical, 15)
        .padding(.leading, 35)
        .padding(.trailing, 15)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               alignment: .leading)
        .background(Color.customSecondaryBackground)
        .cornerRadius(18)
        .padding(.horizontal, 15)
    }
}

// MARK: - UPCOMING ROOM
struct GroupRoomsView: View {
    
    let room: UpcomingRoom
    
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            
            Text(room.date, style: .time)
                .font(Font.Nunito.semiBold(size: 10))
                .foregroundColor(Color.textYellow)
            
            VStack(alignment: .leading) {
              
                if let groupName = room.groupName {
                    HStack(spacing: 3) {
                        Text(groupName.uppercased())
                            .font(Font.Nunito.bold(size: 8))
                            .foregroundColor(Color.textBlack)
                        Image
                            .home
                            .font(Font.Nunito.bold(size: 10))
                            .foregroundColor(Color.customGreen)
                    }
                    .padding(.top, 1)
                }

                Text(room.roomName)
                    .lineLimit(1)
                    .font(Font.Nunito.bold(size: 14))
                    .foregroundColor(Color.textBlack)
            }
        }
    }
}

struct UpcomingRoomsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UpcomingRoomsView(upcomingRooms: UpcomingRoom.dummyData)
                .previewLayout(.sizeThatFits)
            GroupRoomsView(room: UpcomingRoom.dummyData.first!)
                .previewLayout(.sizeThatFits)
        }
    }
}
