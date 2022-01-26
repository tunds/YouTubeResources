//
//  CounterView.swift
//  SwiftUI @State
//
//  Created by Tunde on 03/07/2021.
//

import SwiftUI

struct CounterView: View {
    
    @EnvironmentObject var viewModel: CounterViewModel
    
    var body: some View {
        
        HStack(spacing: 16) {
            
            Button(action: {
                viewModel.increase()
            }, label: {
                Text("Increase")
            })
            
            Button(action: {
                viewModel.decrease()
            }, label: {
                Text("Decrease")
            })
        }
    }
}

struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView()
            .environmentObject(CounterViewModel())
    }
}
