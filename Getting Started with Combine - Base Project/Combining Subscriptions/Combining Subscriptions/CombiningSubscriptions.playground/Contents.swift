import UIKit
import Combine

/*
 * Combine two publishers and validate any nil values remove it
 *
 */

let meals: Publishers.Sequence<[String?], Never> = ["🍔", "🌭", "🍕", nil].publisher
let people: Publishers.Sequence<[String?], Never> = ["Tunde", "Bob", "Toyo", "Jack"].publisher
