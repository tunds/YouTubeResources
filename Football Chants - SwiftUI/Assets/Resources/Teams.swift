//
//  Badges.swift
//  Football Chants
//
//  Created by Tunde on 12/12/2020.
//

import SwiftUI

enum TeamType {
    case arsenal
    case astonVilla
    case brighton
    case burnley
    case chelsea
    case everton
    case fulham
    case leeds
    case leicester
    case liverpool
    case manchesterUnited
    case manchesterCity
    case newcastle
    case palace
    case sheffield
    case southampton
    case tottenham
    case westBrom
    case wolves
}

extension TeamType {
    
    var badge: String {
        switch self {

        case .arsenal:
            return "arsenal_ic"
        case .astonVilla:
            return "aston_villa_ic"
        case .brighton:
            return "brighton_ic"
        case .burnley:
            return "burnley_ic"
        case .chelsea:
            return "chelsea_ic"
        case .everton:
            return "everton_ic"
        case .fulham:
            return "fulham_ic"
        case .leeds:
            return "leeds_ic"
        case .leicester:
            return "leicester_ic"
        case .liverpool:
            return "liverpool_ic"
        case .manchesterUnited:
            return "manchester_united_ic"
        case .manchesterCity:
            return "manchester_city_ic"
        case .newcastle:
            return "newcastle_ic"
        case .palace:
            return "palace_ic"
        case .sheffield:
            return "sheffield_ic"
        case .southampton:
            return "southampton_ic"
        case .tottenham:
            return "tottenham_ic"
        case .westBrom:
            return "west_brom_ic"
        case .wolves:
            return "wolves_ic"
        }
    }
    
    var background: Color {
        switch self {

        case .arsenal:
            return Color("arsenal_bg")
        case .astonVilla:
            return Color("aston_villa_bg")
        case .brighton:
            return Color("brighton_bg")
        case .burnley:
            return Color("burnley_bg")
        case .chelsea:
            return Color("chelsea_bg")
        case .everton:
            return Color("everton_bg")
        case .fulham:
            return Color("fulham_bg")
        case .leeds:
            return Color("leeds_bg")
        case .leicester:
            return Color("leicester_bg")
        case .liverpool:
            return Color("liverpool_bg")
        case .manchesterUnited:
            return Color("manchester_united_bg")
        case .manchesterCity:
            return Color("manchester_city_bg")
        case .newcastle:
            return Color("newcastle_bg")
        case .palace:
            return Color("palace_bg")
        case .sheffield:
            return Color("sheffield_bg")
        case .southampton:
            return Color("southampton_bg")
        case .tottenham:
            return Color("tottenham_bg")
        case .westBrom:
            return Color("west_brom_bg")
        case .wolves:
            return Color("wolves_bg")
        }
    }
    
    var chantFile: String {
        switch self {

        case .arsenal:
            return "arsenal"
        case .astonVilla:
            return "aston_villa"
        case .brighton:
            return "brighton"
        case .burnley:
            return "burnley"
        case .chelsea:
            return "chelsea"
        case .everton:
            return "everton"
        case .fulham:
            return "fulham"
        case .leeds:
            return "leeds"
        case .leicester:
            return "leicester"
        case .liverpool:
            return "liverpool"
        case .manchesterUnited:
            return "manchester_united"
        case .manchesterCity:
            return "manchester_city"
        case .newcastle:
            return "newcastle"
        case .palace:
            return "palace"
        case .sheffield:
            return "sheffield"
        case .southampton:
            return "southampton"
        case .tottenham:
            return "tottenham"
        case .westBrom:
            return "west_brom"
        case .wolves:
            return "wolves"
        }
    }
}
