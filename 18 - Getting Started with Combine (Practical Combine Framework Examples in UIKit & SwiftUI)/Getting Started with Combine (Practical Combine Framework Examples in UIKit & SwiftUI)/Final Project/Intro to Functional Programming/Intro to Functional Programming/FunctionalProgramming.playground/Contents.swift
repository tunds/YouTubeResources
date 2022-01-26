import UIKit

var items: [String?] = ["Femi", "Pete", "Bryan", nil]

func filterNils(in items: [String?]) -> [String] {
    var myItems = [String]()
    for item in items {
        if let item = item {
            myItems.append(item)
        }
    }
    return myItems
}

print(filterNils(in: items))


let combined = items
            .compactMap { $0 }
            .map { $0 }
            .joined(separator: ", ")


print(combined)
