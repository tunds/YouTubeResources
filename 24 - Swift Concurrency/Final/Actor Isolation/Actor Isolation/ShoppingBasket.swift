//
//  ShoppingBasket.swift
//  Actor Isolation
//
//  Created by Tunde on 09/10/2021.
//

import Foundation

// MODELS

actor Teacher {
    let id = UUID()
    var students: [Student] = []
}

struct Student: Sendable {
    let name: String
    let hasCheckIns: Bool
    var subjects: [Subject]
}

struct Subject: Sendable {
    let title: String
}

let teacher1 = Teacher()
let teacher2 = Teacher()

extension Teacher {
    static func compare(_ item1: Teacher, _ item2: Teacher) -> Bool {
        item1 == item2
    }
}

// Equatable

extension Teacher: Equatable {
    static func == (lhs: Teacher, rhs: Teacher) -> Bool {
        lhs.id == rhs.id
    }
}

// Hashable conformance
extension Teacher: Hashable {
    nonisolated var hashValue: Int { id.hashValue }
    nonisolated func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
