import UIKit
import Combine

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let postURL = URL(string: "https://jsonplaceholder.typicode.com/posts")

func getPosts() -> AnyPublisher<[Post], Never> {
    
    let postsPublisher = URLSession
        .shared
        .dataTaskPublisher(for: postURL!)
        .map { $0.data }
        .decode(type: [Post].self, decoder: JSONDecoder())
        .catch { _ in return Just([]) }
        .eraseToAnyPublisher()
    
    return postsPublisher
}

var subscriptions = Set<AnyCancellable>()

getPosts()
    .sink { (posts) in
        print(posts)
    }
    .store(in: &subscriptions)
