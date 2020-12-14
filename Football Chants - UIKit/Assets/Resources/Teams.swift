//
//  Badges.swift
//  Football Chants
//
//  Created by Tunde on 12/12/2020.
//

import UIKit

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
    
    var badge: UIImage {
        switch self {

        case .arsenal:
            return UIImage(named: "arsenal_ic")!
        case .astonVilla:
            return UIImage(named: "aston_villa_ic")!
        case .brighton:
            return UIImage(named: "brighton_ic")!
        case .burnley:
            return UIImage(named: "burnley_ic")!
        case .chelsea:
            return UIImage(named: "chelsea_ic")!
        case .everton:
            return UIImage(named: "everton_ic")!
        case .fulham:
            return UIImage(named: "fulham_ic")!
        case .leeds:
            return UIImage(named: "leeds_ic")!
        case .leicester:
            return UIImage(named: "leicester_ic")!
        case .liverpool:
            return UIImage(named: "liverpool_ic")!
        case .manchesterUnited:
            return UIImage(named: "manchester_united_ic")!
        case .manchesterCity:
            return UIImage(named: "manchester_city_ic")!
        case .newcastle:
            return UIImage(named: "newcastle_ic")!
        case .palace:
            return UIImage(named: "palace_ic")!
        case .sheffield:
            return UIImage(named: "sheffield_ic")!
        case .southampton:
            return UIImage(named: "southampton_ic")!
        case .tottenham:
            return UIImage(named: "tottenham_ic")!
        case .westBrom:
            return UIImage(named: "west_brom_ic")!
        case .wolves:
            return UIImage(named: "wolves_ic")!
        }
    }
    
    var background: UIColor {
        switch self {

        case .arsenal:
            return UIColor(named: "arsenal_bg")!
        case .astonVilla:
            return UIColor(named: "aston_villa_bg")!
        case .brighton:
            return UIColor(named: "brighton_bg")!
        case .burnley:
            return UIColor(named: "burnley_bg")!
        case .chelsea:
            return UIColor(named: "chelsea_bg")!
        case .everton:
            return UIColor(named: "everton_bg")!
        case .fulham:
            return UIColor(named: "fulham_bg")!
        case .leeds:
            return UIColor(named: "leeds_bg")!
        case .leicester:
            return UIColor(named: "leicester_bg")!
        case .liverpool:
            return UIColor(named: "liverpool_bg")!
        case .manchesterUnited:
            return UIColor(named: "manchester_united_bg")!
        case .manchesterCity:
            return UIColor(named: "manchester_city_bg")!
        case .newcastle:
            return UIColor(named: "newcastle_bg")!
        case .palace:
            return UIColor(named: "palace_bg")!
        case .sheffield:
            return UIColor(named: "sheffield_bg")!
        case .southampton:
            return UIColor(named: "southampton_bg")!
        case .tottenham:
            return UIColor(named: "tottenham_bg")!
        case .westBrom:
            return UIColor(named: "west_brom_bg")!
        case .wolves:
            return UIColor(named: "wolves_bg")!
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
