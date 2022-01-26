//
//  AccountStore.swift
//  AccountStore
//
//  Created by Tunde on 28/08/2021.
//

import Foundation

class AccountStore {
    
    typealias TransactionsHandler = (Transaction) -> Void
    
    func generate(completion: @escaping TransactionsHandler) {
        let random = Int.random(in: 10...100)
        DispatchQueue.concurrentPerform(iterations: random) { iteration in
            let newTransaction = TransactionBuilder.new
            completion(newTransaction)
        }
        print("Finished generating transactions")
    }
//    
//    func fetch(_  completion: @escaping (Transaction) -> Void) {
////        let transactionsToGenerate = Int.random(in: 1...5)
////        print("About to create: \(transactionsToGenerate) transactions")
//        DispatchQueue.concurrentPerform(iterations: 1500) { iteration in
//            let newTransaction = TransactionBuilder.new
//            self.cache(newTransaction)
//
//            // completion(TransactionBuilder.new)
//        }
//    }
}
