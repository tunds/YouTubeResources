//
//  QuotesViewModel.swift
//  QuotesViewModel
//
//  Created by Tunde on 28/09/2021.
//

import Foundation
import AnimeQuotes

final class QuotesViewModel: ObservableObject {
    
    @Published private(set) var quotes: [Quote] = []
    
    private let service: AnimeQuoteService
    
    init(service: AnimeQuoteService) {
        self.service = service
    }
    

}

private extension QuotesViewModel {
    
    func retrieveQuotes() async -> [Quote] {
        
        await withCheckedContinuation { continuation in
            
            service.fetchQuotes { res in
                continuation.resume(returning: try! res.get())
            }
        }
    }
}
