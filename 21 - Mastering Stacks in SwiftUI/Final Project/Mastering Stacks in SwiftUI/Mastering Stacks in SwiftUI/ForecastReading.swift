//
//  ForecastReading.swift
//  Mastering Stacks in SwiftUI
//
//  Created by Tunde on 26/06/2021.
//

import Foundation

struct ForecastReading {
    let time: String
    let symbol: String
    let temp: Double
}

extension ForecastReading {
    
    static var dummyData: [ForecastReading] {
        
        [
            ForecastReading(time: "Now", symbol: "sun.max.fill", temp: 108),
            ForecastReading(time: "6 AM", symbol: "sun.max.fill", temp: 102),
            ForecastReading(time: "7 AM", symbol: "sun.max.fill", temp: 103),
            ForecastReading(time: "8 AM", symbol: "sun.max.fill", temp: 105),
            ForecastReading(time: "8:33 AM", symbol: "cloud.sun.fill", temp: 106),
            ForecastReading(time: "9 AM", symbol: "cloud.sun.fill", temp: 107),
            ForecastReading(time: "10 AM", symbol: "cloud.sun.fill", temp: 90)
        ]
    }
}
