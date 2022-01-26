//
//  ContentView.swift
//  Clubhouse
//
//  Created by Tunde on 28/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showProfile: Bool?
    @State private var isPresentingRoom = false
    
    @EnvironmentObject var viewModel: RoomViewModel
    
    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .bottom) {
                VStack {

                    NavigationLink(destination: ProfileView(),
                                   tag: true,
                                   selection: $showProfile) {
                        EmptyView()
                    }

                    HomeHeaderView { action in
                        
                        switch action {
                        case .profile:
                            showProfile = true
                        }
                    
                    }

                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(FeedItem.dummyData) { feedItem in
                                switch feedItem.item {
                                case is UpcomingFeedItem:
                                    let upcomingFeedItem = feedItem.item as! UpcomingFeedItem
                                    UpcomingRoomsView(upcomingRooms: upcomingFeedItem.upcoming)
                                case is RoomFeedItem:
                                    let roomFeedItem = feedItem.item as! RoomFeedItem
                                    FeedRoomView(room: roomFeedItem.room)
                                        .onTapGesture {
                                            isPresentingRoom.toggle()
                                            viewModel.setActive(roomFeedItem.room)
                                        }
                                        .fullScreenCover(isPresented: $isPresentingRoom, content: {
                                            RoomView()
                                                .environmentObject(viewModel)
                                        })

                                default:
                                    EmptyView()
                                }
                            }
                        }
                        .padding(.top, 22)
                        .padding(.bottom, 150)
                    }
                }
                .padding(.top, 75)

                BottomFeedView()
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
                   maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color.background)
            .ignoresSafeArea()
            .navigationBarHidden(true)
        }
        .onAppear {
           showProfile = false
           isPresentingRoom = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RoomViewModel())
    }
}
