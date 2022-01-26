//
//  BankCardView.swift
//  BankCardView
//
//  Created by Tunde on 28/08/2021.
//

import SwiftUI

struct BankCardView: View {
    
    var body: some View {
        VStack {
            Text("£30.00")
                .font(.system(size: 35, weight: .semibold))
                .padding(.top, 25)
                .frame(maxWidth: .infinity)
            Image(systemName: "creditcard")
                .font(.system(size: 100, weight: .bold))
            Text("Monzo")
                .font(.caption)
                .padding(.bottom, 25)
        }
        .listRowSeparator(.hidden)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

struct BankCardView_Previews: PreviewProvider {
    static var previews: some View {
        BankCardView()
    }
}
