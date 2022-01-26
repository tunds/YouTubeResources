//
//  CharacterService.swift
//  CharacterService
//
//  Created by Tunde on 09/08/2021.
//

import Foundation

enum CharacterServiceError: Error {
    case invalidServerResponse
}

protocol CharacterService {
    func fetchAllCharacters() async throws -> [Character]
}

struct CharacterServiceImpl: CharacterService {
    
    func fetchAllCharacters() async throws -> [Character] {
        
        let url = "https://rickandmortyapi.com/api/character"
        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw CharacterServiceError.invalidServerResponse
              }
        
        let decodedData = try JSONDecoder().decode(CharacterServiceResult.self, from: data)
        return decodedData.results
    }
}
