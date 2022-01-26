//
//  HourlyForecastView.swift
//  Mastering Stacks in SwiftUI
//
//  Created by Tunde on 26/06/2021.
//

import SwiftUI

struct HourlyForecastView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "clock")
                Text("Hourly Forecast".uppercased())
                Spacer()
            }
            .font(.system(size: 12, weight: .light))
            .foregroundColor(Color.white.opacity(0.8))
            ForecastListView()
        }
        .padding()
        .background(Color.blue.opacity(0.75))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct HourlyForecastView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyForecastView()
    }
}
