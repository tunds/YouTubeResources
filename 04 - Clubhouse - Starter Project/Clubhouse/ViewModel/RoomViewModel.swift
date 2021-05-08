//
//  RoomViewModel.swift
//  Clubhouse
//
//  Created by Tunde on 05/03/2021.
//

import Foundation

class RoomViewModel: ObservableObject {

    private(set) var activeRoom: FeedRoom = FeedRoom.dummyData[0]

    func setActive(_ room: FeedRoom) {
        self.activeRoom = room
    }
}
