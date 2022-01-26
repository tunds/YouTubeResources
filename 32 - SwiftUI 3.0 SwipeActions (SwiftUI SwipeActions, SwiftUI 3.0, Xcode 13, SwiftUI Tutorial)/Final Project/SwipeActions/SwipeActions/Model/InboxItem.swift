//
//  InboxItem.swift
//  InboxItem
//
//  Created by Tunde on 02/08/2021.
//

import Foundation

struct InboxItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let body: String
    let dateRecieved: Date
    let hasAttached: Bool
    
    var isFlagged: Bool
    var isRead: Bool
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: dateRecieved)
    }
}
