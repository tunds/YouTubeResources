//
//  QuotesViewModel.swift
//  QuotesViewModel
//
//  Created by Tunde on 20/07/2021.
//

import Foundation

protocol QuotesViewModel: ObservableObject {
    func getAllQuotes() async
}

@MainActor
final class QuotesViewModelImpl: QuotesViewModel {
    
    @Published private(set) var quotes: [Quote] = []
    
    private let service: QuotesService
    
    init(service: QuotesService) {
        self.service = service
    }
    
    func getAllQuotes() async {
        
        do {
            self.quotes = try await service.fetch()
        } catch {
            print(error)
        }
    }
}
