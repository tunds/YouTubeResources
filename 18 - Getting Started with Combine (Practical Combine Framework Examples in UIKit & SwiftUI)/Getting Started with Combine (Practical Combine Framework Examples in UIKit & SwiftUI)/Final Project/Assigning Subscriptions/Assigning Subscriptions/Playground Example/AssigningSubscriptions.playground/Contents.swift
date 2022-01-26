import UIKit
import Combine

final class LevelsManager {
    
    var level: Int = 0 {
        didSet {
            if let message = level.message {
                print(message)
            }
        }
    }
}

extension Int {
    
    var message: String? {
        
        switch self {
        case 25:
            return "You've achieved bronze status"
        case 50:
            return "You've achieved silver status"
        case 100:
            return "You've achieved gold status"
        default:
            return nil
        }
    }
}

let lvlManager = LevelsManager()
let levelsRange = (0...100)
let cancellable = levelsRange
    .publisher
    .assign(to: \.level, on: lvlManager)
