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
