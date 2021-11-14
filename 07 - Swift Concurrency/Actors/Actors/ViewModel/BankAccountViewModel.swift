//
//  BankAccountViewModel.swift
//  BankAccountViewModel
//
//  Created by Tunde on 30/08/2021.
//

import Foundation
import SwiftUI

/* OLD CLASS IMPLEMENTATION
class BankAccountStore {
    
    let id = UUID()
    private(set) var transactions = [Transaction]()
    
    func add(_ transaction: Transaction) {
        self.transactions.append(transaction)
    }
}
**/

// Actor implementation
actor BankAccountStore {
    
    let id = UUID()
    private(set) var transactions = [Transaction]()
    
    func add(_ transaction: Transaction) {
        self.transactions.append(transaction)
    }
}

@MainActor
class BankAccountViewModel: ObservableObject {
    
    private let store = BankAccountStore()
    
    @Published private(set) var transactions: [Transaction] = []

    func generateTransactions() async {
        
        await withTaskGroup(of: Transaction.self) { group in
            for _ in 0...Int.random(in: 1...50) {
                group.addTask {
                    let newTransaction = TransactionBuilder.new
                    return newTransaction
                }
            }
            for await transaction in group {
                await store.add(transaction)
            }
            self.transactions = await store.transactions.sorted(by: { $0.createdAt.compare($1.createdAt) == .orderedDescending })
            print("Transactions: \(await store.transactions.count)")
        }
    }
    
    //    func generateTransactions() {
    //
    //        DispatchQueue.concurrentPerform(iterations: 10) { _ in
    //            store.add(TransactionBuilder.new)
    //        }
    //    }
        
}


//class BankAccountViewModel: ObservableObject {
//
//
//    private(set) var transactions = [Transaction]()
////    @Published private(set) var transactions = [Transaction]() {
////        didSet {
////            self.total = transactions
////                                    .map { $0.amount }
////                                    .reduce(0, +)
////        }
////    }
////
////    @Published private(set) var total: Decimal = .zero
////
//    private let service: AccountStore
//
//    init(service: AccountStore) {
//        self.service = service
//        service.generate { [unowned self] item in
//            Task {
//                await self.add(item)
//            }
//            //DispatchQueue.main.async {
//             //   self.transactions.append(item)
//           // }
//        }
//    }
//
//    func fetchTransactions() async {
////        service.generate { [unowned self] item in
////            self.transactions.append(item)
////        }
////        service.retrieveCachedTransactions { [weak self] transaction in
////            guard let self = self else { return }
////
////                DispatchQueue.main.async {
////                    withAnimation {
////                    self.transactions.append(transaction)
////                }
////            }
////
////        }
//    }
//}
//
//private extension BankAccountViewModel {
//
//    func add(_ transaction: Transaction) {
//        self.transactions.append(transaction)
//    }
//}
