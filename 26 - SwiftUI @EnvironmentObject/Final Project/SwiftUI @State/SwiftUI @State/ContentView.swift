//
//  ContentView.swift
//  SwiftUI @State
//
//  Created by Tunde on 28/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CounterViewModel()

    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 16) {
                
                Text("🍕 Slices: \(viewModel.counter)")
                    
                CounterView()
                
                NavigationLink("Confirm Order",
                               destination: ConfirmationOrderView())
            }
            .navigationTitle("Pizza Order")
        }
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
