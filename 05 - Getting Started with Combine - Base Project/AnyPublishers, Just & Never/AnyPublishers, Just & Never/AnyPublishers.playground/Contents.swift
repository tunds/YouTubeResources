import UIKit
import Combine

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

let postURL = URL(string: "https://jsonplaceholder.typicode.com/posts")
