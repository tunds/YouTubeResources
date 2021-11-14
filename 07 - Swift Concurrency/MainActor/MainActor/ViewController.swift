//
//  ViewController.swift
//  MainActor
//
//  Created by Tunde on 16/10/2021.
//

import UIKit

struct TodoService {
    
    func fetch() async throws -> [Todo] {
        let url = "https://jsonplaceholder.typicode.com/todos"
        let (data, response) = try await URLSession.shared.data(from: URL(string: url)!)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
                  throw TodoError.invalidRequest
              }
        
        let decodedData = try JSONDecoder().decode([Todo].self, from: data)
        return decodedData
    }
    
}

// Implictly already on the main thread
class ViewController: UIViewController {

    private let service = TodoService()
    
    override func viewDidLoad() {...}

    nonisolated func fetchToDos() async throws {
        let todos = await service.fetch()
       // Handle any caching or tasks that don't involve updating UI on main thread
    }
}

