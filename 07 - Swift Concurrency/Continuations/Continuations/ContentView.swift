//
//  ContentView.swift
//  Continuations
//
//  Created by Tunde on 28/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            
            Text("Hello World")
            .navigationTitle("Quotes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
