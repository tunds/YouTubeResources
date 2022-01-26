//
//  CharacterViewModel.swift
//  CharacterViewModel
//
//  Created by Tunde on 09/08/2021.
//

import Foundation

protocol CharacterViewModel: ObservableObject {
    func getCharacters() async
}

@MainActor
final class CharacterViewModelImpl: CharacterViewModel {
    
    enum State {
        case na
        case loading
        case success(data: [Character])
        case failed(error: Error)
    }
    
    @Published private(set) var state: State = .na
    @Published var hasError: Bool = false
    
    // Handle Errors with the alert
    private let service: CharacterService
    
    init(service: CharacterService) {
        self.service = service
    }
    
    func getCharacters() async {
        self.state = .loading
        self.hasError = false
        do {
            let data = try await service.fetchAllCharacters()
            self.state = .success(data: data)
        } catch {
            self.state = .failed(error: error)
            self.hasError = true
        }
    }
}
