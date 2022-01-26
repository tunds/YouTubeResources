//
//  CounterViewModel.swift
//  SwiftUI @State
//
//  Created by Tunde on 03/07/2021.
//

import Foundation

final class CounterViewModel: ObservableObject {
    
    @Published private(set) var counter = 0
    
    func increase() {
        counter += 1
    }
    
    func decrease() {
        guard counter > 0 else { return }
        counter -= 1
    }
}
