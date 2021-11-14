import UIKit

// MARK: Models

struct User: Codable {
    let id: Int
    let name: String
    let username: String
}

struct Post: Codable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}

struct ContentService {
    
    typealias Content = (users: [User], post: [Post])
    typealias ContentHandler = (Result<Content, Error>) -> Void
    enum ContentError: Error {
        case invalidRequest
        case failedToDecode
        case custom(error: Error)
    }
    
    func fetchContent(completion: @escaping ContentHandler) {
        fetch(URL(string: "https://jsonplaceholder.typicode.com/users")!,
              type: [User].self) { res in
            
            switch res {
                
            case .success(let users):
                
                let users = users
                
                fetch(URL(string: "https://jsonplaceholder.typicode.com/posts")!,
                      type: [Post].self) { res in
                    
                    switch res {
                        
                    case .success(let posts):
                        
                        let posts = posts
                        completion(.success((users, posts)))
                        
                    case .failure(let err):
                        completion(.failure(err))
                    }
                }
                
            case .failure(let err):
                // Failed to handle error path here
                break
            }
        }
    }
    
    private func fetch<T: Codable>(_ url: URL,
                                   type: T.Type,
                                   completion: @escaping (Result<T, Error>) -> Void) {
        
       
        URLSession
            .shared
            .dataTask(with: url) { data, response, error in
            
                DispatchQueue.main.async {
                    
                    if let error = error {
                        completion(.failure(ContentError.custom(error: error)))
                        return
                    }
                    
                    if let response = response as? HTTPURLResponse,
                       response.statusCode == 200 {
                        
                        guard let data = data,
                              let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                               completion(.failure(ContentError.failedToDecode))
                               return
                        }
                        
                        completion(.success(decodedData))
                        
                    } else {
                        completion(.failure(ContentError.invalidRequest))
                    }
                }

                
        }.resume()
    }
}

let service = ContentService()
service.fetchContent { res in
    switch res {
    case .success(let data):
        print("/***START OF USERS***/")
        dump(data.users)
        print("/***END OF USERS***/")
        print("/***START OF POSTS***/")
        dump(data.post)
        print("/***END OF POSTS***/")
    case .failure(let error):
        print(error)
    }
}
