//
//  ContentView.swift
//  SwiftUI @State
//
//  Created by Tunde on 28/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isOn: Bool = false

    var body: some View {
        
        VStack(spacing: 16) {
            
            LightBulbView(isOn: $isOn)
            
            Toggle("", isOn: $isOn)
                .labelsHidden()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
