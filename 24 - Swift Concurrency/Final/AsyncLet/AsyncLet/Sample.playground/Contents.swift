import UIKit

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

Task {
    
    do {
        
        let start = Date.now
        
        let todoService = TodoService()
        
        async let firstPost = todoService.fetch(id: 1)
        async let secondPost = todoService.fetch(id: 2)
        async let thirdPost = todoService.fetch(id: 3)

        let result = try await [firstPost, secondPost, thirdPost]
        
        let end = Date.now
        let nanoseconds = Calendar.current.dateComponents([.nanosecond], from: start, to: end).nanosecond
        print("Finished execution in \(nanoseconds) nanoseconds")
        print("Number of todos: \(result.count)")
    } catch {
        print(error)
    }
}
