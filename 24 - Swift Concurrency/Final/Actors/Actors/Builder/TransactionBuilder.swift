//
//  TransactionBuilder.swift
//  TransactionBuilder
//
//  Created by Tunde on 28/08/2021.
//

import Foundation

struct TransactionBuilder {
    
    private static let names = [
        "🙋🏾‍♀️ Mum",
        "🙋🏾‍♂️ Dad",
        "👨🏾‍🦱 Bro",
        "👩🏾‍🦰 Sis",
        "🏠 Rent",
        "👨🏾‍💼 Job",
        "🔌 Electric",
        "🚗 Uber",
        "🍕 Dominos",
        "🍎 Apple",
        "🩳 Clothes Shopping",
        "🔫 Water Bill",
        "🛒 Lidl",
        "🍿 Movies",
        "🏝 Holiday",
        "🏋️‍♂️ Gym"
    ]
    
    static var new: Transaction {
        .init(name: names.randomElement()!,
              type: Bool.random() ? .incoming : .outgoing,
              amount: Decimal(.random(in: 1..<1000)))
    }
}
