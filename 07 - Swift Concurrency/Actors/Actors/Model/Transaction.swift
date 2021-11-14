//
//  Transaction.swift
//  Transaction
//
//  Created by Tunde on 28/08/2021.
//

import Foundation

struct Transaction: Identifiable {
    
    enum `Type` {
        case incoming, outgoing
    }
    
    let id = UUID()
    let createdAt = Date()
    let name: String
    let type: `Type`
    let amount: Decimal
}
