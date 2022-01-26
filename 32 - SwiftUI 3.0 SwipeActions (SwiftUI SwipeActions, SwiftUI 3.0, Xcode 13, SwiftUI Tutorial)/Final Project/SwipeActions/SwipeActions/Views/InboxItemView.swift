//
//  InboxItemView.swift
//  InboxItemView
//
//  Created by Tunde on 02/08/2021.
//

import SwiftUI

struct InboxItemView: View {
    
    let item: InboxItem
    
    var body: some View {
        
        VStack {
            HStack(alignment: .top) {
               
                HStack {
                    if !item.isRead {
                        Circle()
                            .frame(width: 10,
                               height: 10)
                            .foregroundColor(.accentColor)
                    }
                    Text(item.title)
                        .font(.headline)
                }
                Spacer()
                Text(item.formattedDate)
                    .font(.caption)
                    .opacity(0.5)
            }
            HStack {
                Text(item.subtitle)
                    .font(.callout)
                    .lineLimit(1)
                Spacer()
                if item.hasAttached {
                    Image(systemName: "paperclip")
                        .font(.system(size: 14, weight: .light))
                        .foregroundColor(Color.gray)
                }
                if item.isFlagged {
                    Image(systemName: "flag.fill")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(Color.red)
                }
            }
            
            HStack(spacing: 0) {
                Text(item.body)
                    .lineLimit(2)
                    .font(.callout)
                    .opacity(0.5)
                Spacer()
            }
        }
    }
}

struct InboxItemView_Previews: PreviewProvider {
    static var previews: some View {
        let item = InboxItem(title: "Email #1",
                             subtitle: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                             body: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                             dateRecieved: Date(),
                             hasAttached: true,
                             isFlagged: false,
                             isRead: false)
        InboxItemView(item: item)
    }
}
