//
//  ConfirmationOrderView.swift
//  SwiftUI @State
//
//  Created by Tunde on 04/07/2021.
//

import SwiftUI

struct ConfirmationOrderView: View {
    
    @EnvironmentObject var viewModel: CounterViewModel
    
    var body: some View {
        Text("You would like to order \(viewModel.counter) 🍕 slices")
            .navigationTitle("Order Confirmation")
    }
}

struct ConfirmationOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationOrderView()
            .environmentObject(CounterViewModel())
    }
}
