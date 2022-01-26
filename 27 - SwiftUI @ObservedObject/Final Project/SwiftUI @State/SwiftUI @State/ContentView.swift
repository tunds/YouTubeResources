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
        
        VStack(spacing: 16) {
            
            Text("The count is: \(viewModel.counter)")
                
            CounterView(viewModel: viewModel)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
