//
//  ContentView.swift
//  Continuations
//
//  Created by Tunde on 28/09/2021.
//

import SwiftUI
import AnimeQuotes

struct ContentView: View {
    
    @State private var quotes: [Quote] = []
    private let service = AnimeQuoteService()
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(quotes,
                        id: \.anime) { item in
                    
                    VStack(
                        alignment: .leading,
                        spacing: 8) {
                        Text(item.quote!)
                        Text("Anime: \(item.anime!)")
                                .font(.headline)
                    }
                    .padding()
                }
            }
            .navigationTitle("Quotes")
        }
        .task {
            do {
                self.quotes = try await getQuotes()
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

private extension ContentView {
    
    func getQuotes() async throws -> [Quote] {
        try await withCheckedThrowingContinuation { continuation in
            service.fetchQuotes { res in
                switch res {
                case .success(let quotes):
                    continuation.resume(returning: quotes)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
