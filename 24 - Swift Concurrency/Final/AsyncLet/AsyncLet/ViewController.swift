//
//  ViewController.swift
//  AsyncLet
//
//  Created by Tunde on 28/08/2021.
//

import UIKit

class ViewController: UIViewController {

    private let todoService = TodoService()
    private let calendar = Calendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        Task {
            
            do {
                
                let asyncAwaitStart = Date.now

                let _ = try await todoService.fetch(id: 1)
                let _ = try await todoService.fetch(id: 2)
                let _ = try await todoService.fetch(id: 3)
            
                let asyncAwaitEnd = Date.now
                
                let asyncAwaitNanoseconds = calendar.dateComponents([.nanosecond], from: asyncAwaitStart, to: asyncAwaitEnd).nanosecond!

                print("Finished Async Await execution in \(asyncAwaitNanoseconds) nanoseconds")

                let asyncLetStart = Date.now

                async let firstAsyncLetPost = todoService.fetch(id: 1)
                async let secondAsyncLetPost = todoService.fetch(id: 2)
                async let thirdAsyncLetPost = todoService.fetch(id: 3)

                let _ = try await [firstAsyncLetPost, secondAsyncLetPost, thirdAsyncLetPost]

                let asyncLetEnd = Date.now
                let asyncLetNanoseconds = calendar.dateComponents([.nanosecond], from: asyncLetStart, to: asyncLetEnd).nanosecond!

                print("Finished AsyncLet execution in \(asyncLetNanoseconds) nanoseconds")
                if asyncLetNanoseconds < asyncAwaitNanoseconds {
                    print("AsyncLet is quicker ⚡️")
                }
            } catch {
                print(error)
            }
        }

    }
}

// MARK: - Todo Model

struct Todo: Codable {
    let id: Int
    let userId: Int
    let title: String
    let completed: Bool
}

// MARK: - Todo Errors

enum TodoError: Error {
    case invalidRequest
}

// MARK: - Todo Service

struct TodoService {
    
    func fetch(id: Int) async throws -> Todo {
        let url = "https://jsonplaceholder.typicode.com/todos/\(id)"
        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw TodoError.invalidRequest
              }
        
        let decodedData = try JSONDecoder().decode(Todo.self, from: data)
        return decodedData
    }
}

// MARK: - Implementation


