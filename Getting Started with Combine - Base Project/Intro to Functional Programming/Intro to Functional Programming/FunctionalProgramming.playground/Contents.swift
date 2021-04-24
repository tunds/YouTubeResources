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
