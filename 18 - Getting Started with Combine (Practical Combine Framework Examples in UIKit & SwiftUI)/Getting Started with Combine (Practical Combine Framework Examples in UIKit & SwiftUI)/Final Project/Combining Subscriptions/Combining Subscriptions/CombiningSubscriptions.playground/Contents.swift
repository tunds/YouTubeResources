import UIKit
import Combine

/*
 * Combine two publishers and validate any nil values remove it
 *
 */

let meals: Publishers.Sequence<[String?], Never> = ["🍔", "🌭", "🍕", "🥓"].publisher
let people: Publishers.Sequence<[String?], Never> = ["Tunde", "Bob", "Toyo", "Jack"].publisher

enum PersonError: Error {
    case emptyData
}

extension PersonError {
    
    public var errorDescription: String {
        switch self {
        case .emptyData:
            return "There is a nil value somewhere"
        }
    }
}

func validate(person: String?, meal: String?) throws -> String {
    guard let person = person,
          let meal = meal else {
        throw PersonError.emptyData
    }
    
    return "\(person) \(meal)"
}

let subscription = people
    .zip(meals)
    .tryMap({ try validate(person: $0, meal: $1) })
    .sink { completion in
        
        switch completion {
        case .finished:
            print("Finished")
        case .failure(let error as PersonError):
            print("Failed: \(error.errorDescription)")
        case .failure(let error):
            print("Failed: \(error.localizedDescription)")
        }
        
    } receiveValue: { message in
        print(message)
    }
