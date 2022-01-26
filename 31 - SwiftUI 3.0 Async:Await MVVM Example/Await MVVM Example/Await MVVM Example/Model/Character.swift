//
//  Character.swift
//  Character
//
//  Created by Tunde on 09/08/2021.
//

import Foundation

struct CharacterServiceResult: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
}
