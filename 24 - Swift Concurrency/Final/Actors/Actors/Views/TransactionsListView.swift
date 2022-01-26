//
//  TransactionsListView.swift
//  TransactionsListView
//
//  Created by Tunde on 28/08/2021.
//

import SwiftUI

struct TransactionsListView: View {
    
    var body: some View {
        ForEach(0...10, id: \.self) { i in
            
            HStack {
                
                Text("New Transaction")
                    .font(.system(size: 13, weight: .semibold))
                Spacer()
                
                Group {
                    if Bool.random() {
                        Text("+£2.99")
                            .foregroundColor(.mint)
                    } else {
                        Text("£3.99")
                            .foregroundColor(.gray)
                    }
                }
                .font(.headline)
            }
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
            .padding(.vertical, 10)
        }
    }
}

struct TransactionsListView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsListView()
    }
}
