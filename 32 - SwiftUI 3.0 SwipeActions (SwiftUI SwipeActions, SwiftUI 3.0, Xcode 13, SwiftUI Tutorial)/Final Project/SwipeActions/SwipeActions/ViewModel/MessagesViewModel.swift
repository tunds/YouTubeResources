//
//  MessagesViewModel.swift
//  MessagesViewModel
//
//  Created by Tunde on 02/08/2021.
//

import Foundation

final class MessagesViewModel: ObservableObject {
    
   @Published private(set) var data = [
        
        InboxItem(title: "Email #1",
                             subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                             body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                             dateRecieved: Date(timeIntervalSince1970: 1627924568),
                             hasAttached: true,
                             isFlagged: false,
                             isRead: false),
        InboxItem(title: "Email #2",
                             subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                             body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                             dateRecieved: Date(timeIntervalSince1970: 1627925568),
                             hasAttached: true,
                             isFlagged: true,
                             isRead: true),
        InboxItem(title: "Email #3",
                             subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                             body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                             dateRecieved: Date(timeIntervalSince1970: 1627924569),
                             hasAttached: false,
                             isFlagged: false,
                             isRead: true),
        InboxItem(title: "Email #4",
                             subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                             body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                             dateRecieved: Date(timeIntervalSince1970: 1627935568),
                             hasAttached: true,
                             isFlagged: false,
                             isRead: true),
        InboxItem(title: "Email #5",
                             subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                             body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                             dateRecieved: Date(timeIntervalSince1970: 1627964568),
                             hasAttached: false,
                             isFlagged: false,
                             isRead: false),
        InboxItem(title: "Email #6",
                             subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                             body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                             dateRecieved: Date(timeIntervalSince1970: 1627978568),
                             hasAttached: false,
                             isFlagged: false,
                             isRead: false),
        InboxItem(title: "Email #7",
                             subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                             body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                             dateRecieved: Date(timeIntervalSince1970: 1627994568),
                             hasAttached: false,
                             isFlagged: false,
                             isRead: false) ,
        InboxItem(title: "Email #8",
                           subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                           body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                           dateRecieved: Date(timeIntervalSince1970: 1627934568),
                           hasAttached: false,
                           isFlagged: false,
                           isRead: false)
    ]
    
    func toggleRead(for item: InboxItem) {
        if let index = data.firstIndex(where: { $0.id == item.id }) {
            data[index].isRead.toggle()
        }
    }
    
    func toggleFlagged(for item: InboxItem) {
        if let index = data.firstIndex(where: { $0.id == item.id }) {
            data[index].isFlagged.toggle()
        }
    }
    
    func delete(_ item: InboxItem) {
        data.removeAll(where: { $0.id == item.id })
    }
}
