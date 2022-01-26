//
//  ForecastView.swift
//  Mastering Stacks in SwiftUI
//
//  Created by Tunde on 26/06/2021.
//

import SwiftUI

struct ForecastView: View {
    
    let forecast: ForecastReading
    
    private func format(temp: Double) -> String {
        
        let formatter = MeasurementFormatter()
        let distanceInMeters = Measurement(value: temp,
                                           unit: UnitTemperature.celsius)
        formatter.unitOptions = .temperatureWithoutUnit
        return formatter.string(from: distanceInMeters)
    }
    
    var body: some View {
        VStack(spacing: 12) {
            Text(forecast.time)
                .font(.system(size: 12, weight: .bold))
            Image(systemName: forecast.symbol)
                .renderingMode(.original)
            Text(format(temp: forecast.temp))
                .font(.system(size: 16, weight: .medium))
        }
        .foregroundColor(.white)
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(forecast: ForecastReading.dummyData.first!)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
