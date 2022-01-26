//
//  RoomView.swift
//  Clubhouse
//
//  Created by Tunde on 03/03/2021.
//

import SwiftUI

struct RoomView: View {

    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: RoomViewModel

    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            VStack {
                
                RoomHeaderView { _ in
                        print("Handle the dismiss here")
                }
                .padding(.bottom, 30)
                
                ScrollView {
                    
                    HStack(alignment: .top, spacing: 0) {
                        Text(viewModel.activeRoom.roomName)
                            .padding(.leading, 25)
                        Spacer()
                        Image.ellipsis
                            .padding(.top, 10)
                            .padding(.trailing, 25)
                    }
                    .padding(.top, 15)
                    .foregroundColor(Color.textBlack)
                    .font(Font.Nunito.bold(size: 20))
                    
                    // Hosts
                    Group {
                        
                        // Hosts in the room
                        
                        HostsView(people: viewModel.activeRoom.hosts)
                        
                        // Followed By Speakers
                        
                        if !viewModel.activeRoom.followedBySpeaker.isEmpty {
                        
                        OthersView(title: "Followed by the speakers",
                                   people: viewModel.activeRoom.followedBySpeaker)

                        }
                        
                        // Others in the room
                        
                        OthersView(title: "Others in the room",
                                   people: viewModel.activeRoom.othersInRoom)
                    }
                    .padding(.horizontal, 15)

                }
                .padding(.bottom, 110)
                .background(Color.cardBackground)
                .cornerRadius(37)
                
            }
            .padding(.top, 65)
            
            BottomRoomView { item in
                switch item {
                case .leave:
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
               maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.background)
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

// MARK: - Host View

struct HostsView: View {
    
    let people: [Person]
    
    private let speakersColumns = [
        GridItem(.fixed(85), spacing: 24),
        GridItem(.fixed(85), spacing: 24),
        GridItem(.fixed(85), spacing: 24)
    ]
    
    var body: some View {

        LazyVGrid(columns: speakersColumns,
                  alignment: .leading,
                  spacing: 10) {
            ForEach(people) { person in
                
                PersonView(person: person)
            }
        }
        .padding(.horizontal, 10)

    }
}

// MARK: - Others in the room

struct OthersView: View {
    
    let title: String
    let people: [Person]
    
    private let othersColumns = [
        GridItem(.fixed(65), spacing: 24),
        GridItem(.fixed(65), spacing: 24),
        GridItem(.fixed(65), spacing: 24),
        GridItem(.fixed(65), spacing: 24)
    ]
    
    var body: some View {

        VStack(alignment: .leading) {
            
            Text(title)
                .foregroundColor(Color.customLightGray)
                .font(Font.Nunito.bold(size: 14))

            LazyVGrid(columns: othersColumns,
                      alignment: .leading,
                      spacing: 10) {
                ForEach(people) { person in
                    
                    OtherPersonView(person: person)

                }
            }
        }
        .padding(.top, 20)
        .padding(.horizontal, 25)
        
    }
}

// MARK: - Mute View

struct MuteView: View {
    
    var body: some View {
     
        Image.mute
            .padding(5)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(color: Color.cardShadowTint, radius: 1, x: 0, y: 1)
    }
}

// MARK: - New View

struct NewView: View {
    
    var body: some View {
     
        Text("🎉")
            .padding(5)
            .background(Color.white)
            .clipShape(Circle())
            .shadow(color: Color.cardShadowTint, radius: 1, x: 0, y: 1)
    }
}

// MARK: - Person Profile View

struct PersonImageView: View {
    
    let image: String?

    var body: some View {
       
        if let image = image {
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipShape(ContainerRelativeShape())
            
        } else {
         
            Image
                .person
                .resizable()
                .aspectRatio(contentMode: .fill)
                .background(Color.customLightGray)
                .clipShape(ContainerRelativeShape())
        }
    }
}

// MARK: - Person View

struct PersonView: View {
    
    let person: Person

    var body: some View {
        
        VStack {
            
            Group {
                
                ZStack(alignment: .bottom) {
                    
                    PersonImageView(image: person.img)
                }
                
                HStack(spacing: 0) {
                    
                    if person.state.contains(.moderator) {
                        Image
                            .star
                            .font(Font.Nunito.bold(size: 8))
                            .foregroundColor(Color.white)
                            .padding(2)
                            .background(Color.green)
                            .clipShape(Circle())
                    }
                
                    Text(person.firstName)
                        .foregroundColor(Color.textBlack)
                        .font(Font.Nunito.extraBold(size: 13))
                        .lineLimit(1)
                        .padding(.leading, 5)
                }
            }
            .cornerRadius(35)
        }
        .overlay(MuteView()
                    .offset(x: 40, y: 20)
                    .opacity(person.state.contains(.muted) ? 1 : 0))
        .overlay(NewView()
                    .offset(x: -20, y: 20)
                    .opacity(person.state.contains(.new) ? 1 : 0))
    }
}

// MARK: - Person View

struct OtherPersonView: View {
    
    let person: Person
    
    var body: some View {
        
        VStack {
            
            Group {
                
                ZStack(alignment: .bottom) {
                    
                    PersonImageView(image: person.img)
                }
                
                HStack(spacing: 0) {

                    Text(person.firstName)
                        .foregroundColor(Color.textBlack)
                        .font(Font.Nunito.extraBold(size: 13))
                        .lineLimit(1)
                        .padding(.leading, 5)
                        .minimumScaleFactor(0.8)
                }
            }
            .cornerRadius(20)
        }
        .overlay(NewView()
                    .offset(x: -20, y: 5)
                    .opacity(person.state.contains(.new) ? 1 : 0))
    }
}


struct RoomView_Previews: PreviewProvider {
    static var previews: some View {
        RoomView()
            .environmentObject(RoomViewModel())
    }
}
