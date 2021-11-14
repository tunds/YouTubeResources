import UIKit

// MARK: Models


struct User: Codable {
    let id: Int
    let name: String
    let username: String
}

struct ContentService {
    
    enum ContentError: Error {
        case invalidRequest
        case failedToDecode
        case custom(error: Error)
    }
    
    private func fetch<T: Codable>(_ url: URL,
                           type: T.Type) async throws -> T {
        print("🚨 Preparing the Request for url: \(url.absoluteString)")
        let (data, response) = try await URLSession.shared.data(from: url)
        print("✅ Recivied the Request Response")
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  print("❌ Throwing the Request Error")
                  throw ContentError.invalidRequest
              }
        print("🚨 Trying to decode the data to the generic type")
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        print("✅ Successfully decoded the data to the generic type and preparing to return")
        return decodedData
    }
    
    private func fetchUsers(with ids: [String]) async throws -> [User] {
        var users = [User]()
        for id in ids {
            let user = try await fetch(URL(string: "https://jsonplaceholder.typicode.com/users/\(id)")!,
                                        type: User.self)
            users.append(user)
        }
        return users
    }
}
