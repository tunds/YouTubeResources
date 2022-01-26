//
//  ViewController.swift
//  Actor Reentrancy Example
//
//  Created by Tunde on 02/10/2021.
//

import UIKit

actor BankAccount {
    
    enum AccountError: Error {
        case insufficentFunds
        case failedToAuthorize
    }
    
    private var balance: Decimal = 100
    
    func withdraw(_ amount: Decimal, tag: String) async throws {
        
        print("\(tag): 🚨 Attempting to widthdraw \(amount)")
        
        guard hasSufficentFunds(toWidthdraw: amount) else {
            print("\(tag): ❌ Failed to widthdraw \(amount) due to insufficient funds")
            throw AccountError.insufficentFunds
        }
        
        print("\(tag): ✅ Account has sufficient funds to widthdraw \(amount)")
        
        print("\(tag): 🚨 Attempting to authorize acount with bank")
        guard try await authorizeTransaction() else {
            print("\(tag): ❌ Failed to authorise account with bank")
            throw AccountError.failedToAuthorize
        }
        
        print("\(tag): ✅ Account passed authorization")

        guard hasSufficentFunds(toWidthdraw: amount) else {
            print("\(tag): ❌ Failed to widthdraw \(amount) due to insufficient funds")
            throw AccountError.insufficentFunds
        }
        
        balance -= amount
        
        print("\(tag): ✅ Account successfully widthdrew \(amount)")
        print("\(tag): 🤑 New Balance \(balance)")
    }
}

private extension BankAccount {
    
    func hasSufficentFunds(toWidthdraw amount: Decimal) -> Bool {
        amount <= balance
    }
    
    func authorizeTransaction() async throws -> Bool {
        // TODO: Simulate throwing an error
        try? await Task.sleep(1_000_000_000)
        return true
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let account = BankAccount()

        Task {
            do {
                try await account.withdraw(70, tag: "#Task 1")
            } catch {
                print(error)
            }
        }

        Task {
            do {
                try await account.withdraw(80, tag: "#Task 2")
            } catch {
                print(error)
            }
        }
    }
}
