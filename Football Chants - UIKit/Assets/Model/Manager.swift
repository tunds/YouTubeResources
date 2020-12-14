//
//  Manager.swift
//  Football Chants
//
//  Created by Tunde on 12/12/2020.
//

import Foundation

enum Job: String {
    case manager = "Manager"
    case headCoach = "Head Coach"
}

struct Manager {
    let name: String
    let job: Job
}
