//
//  ContentView.swift
//  Mastering Stacks in SwiftUI
//
//  Created by Tunde on 26/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        List {
            HourlyForecastView()
                .listRowInsets(EdgeInsets()) // Cos you're not doing iOS15 only
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
