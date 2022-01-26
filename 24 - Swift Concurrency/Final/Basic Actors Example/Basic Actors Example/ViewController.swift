//
//  ViewController.swift
//  Basic Actors Example
//
//  Created by Tunde on 02/10/2021.
//

import UIKit

actor Counter {
    
    private(set) var value = 0
    
    func increment() -> Int {
        value += 1
        return value
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let counter = Counter()

        Task.detached {
            print("Counter Value: \(await counter.increment())")
        }

        Task.detached {
            print("Counter Value: \(await counter.increment())")
        }
    }
}

