//
//  ContentView.swift
//  Actors
//
//  Created by Tunde on 28/08/2021.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = BankAccountViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack {
                
                List {
                    BankCardView()
                    // TransactionsListView()
                    ForEach(vm.transactions) { item in
                        Text(item.name)
                    }
                }
                .listStyle(.plain)
                .searchable(text: .constant(""), prompt: "Search Transactions")
                .toolbar {
                    Button {
                        // TODO: Sync and create new transactions
//                        Task {
//                            await vm.fetchTransactions()
//                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                    }
                }
            }
            .navigationTitle("Current Account")
            .task {
                await vm.generateTransactions()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
