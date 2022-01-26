//
//  AccountViewModel.swift
//  PassthroughSubjects
//
//  Created by Tunde on 17/04/2021.
//

import Foundation
import Combine

class AccountViewModel {
    
    enum AccountStatus {
        case active
        case banned
    }
    
    private let warningLimit = 3
    
    let userAccountStatus = CurrentValueSubject<AccountStatus, Never>(.active)
    let warnings = CurrentValueSubject<Int, Never>(0)

    var subscriptions = Set<AnyCancellable>()
    
    init() {
        createSubscriptions()
    }
    
    func increaseWarning() {
        warnings.value += 1
        print("Warning: \(warnings.value)")
    }
}

private extension AccountViewModel {
    
    func createSubscriptions() {
        
        warnings
            .filter({ [weak self] val in
                guard let self = self else { return false }
                return val >= self.warningLimit
            })
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.userAccountStatus.value = .banned
            }
            .store(in: &subscriptions)
    }
}
