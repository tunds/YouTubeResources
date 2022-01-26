//
//  QuotesScreen.swift
//  QuotesScreen
//
//  Created by Tunde on 20/07/2021.
//

import SwiftUI

struct QuotesScreen: View {
    
    @StateObject private var vm = QuotesViewModelImpl(
        service: QuotesServiceImpl()
    )
    
    var body: some View {
        
        Group {
            
            if vm.quotes.isEmpty {
                
                LoadingView(text: "Fetching Quotes...")
                
            } else {
                
                List {
                    ForEach(vm.quotes, id: \.anime) { item in
                        QuoteView(item: item)
                    }
                }
            }
        }
        .task {
            await vm.getAllQuotes()
        }
    }
}

struct QuotesScreen_Previews: PreviewProvider {
    static var previews: some View {
        QuotesScreen()
    }
}
