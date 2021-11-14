// MARK: - Models

import Foundation

public struct Quote: Codable {
    public private(set) var anime: String?
    public private(set) var character: String?
    public private(set) var quote: String?
    
    public init() {}
}

// MARK: - Errors
public enum QuoteServiceError: Error {
    case invalidResponse
    case invalidData
    case failedDecode(description: String)
}

// MARK: - Service

public struct AnimeQuoteService {
    
    public typealias ServiceResult = (Result<[Quote], Error>) -> Void
    
    public init() {}
    
    public func fetchQuotes(completion: @escaping ServiceResult) {
        
        let url = URL(string: "https://animechan.vercel.app/api/quotes")!
        let urlSession = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                      completion(.failure(QuoteServiceError.invalidResponse))
                      return
                  }
            
            do {
                
                guard let data = data else {
                    completion(.failure(QuoteServiceError.invalidData))
                    return
                }
                
                let quotes = try JSONDecoder().decode([Quote].self, from: data)
                completion(.success(quotes))
            } catch {
                completion(.failure(error))
            }
        }
        
        urlSession.resume()
    }
}
