//
//  QuotesService.swift
//  QuotesService
//
//  Created by Tunde on 19/07/2021.
//

import Foundation

protocol QuotesService {
    func fetch() async throws -> [Quote]
}

final class QuotesServiceImpl: QuotesService {
    
    func fetch() async throws -> [Quote] {
        let urlSession = URLSession.shared
        let url = URL(string: APIConstants.baseUrl.appending("/api/quotes"))
        let (data, _) = try await urlSession.data(from: url!)
        return try JSONDecoder().decode([Quote].self, from: data)
    }
}
