import UIKit
import Combine

class AccountViewModel {
    
    enum AccountState {
        case active
        case inactive
    }
    
    struct Account {
        var username: String
        var status: AccountState
    }
    
    let user = CurrentValueSubject<Account, Never>(Account(username: "tundsdev",
                                                           status: .active))
    private var accountState: AccountState = .active {
        
        didSet {
            print("The user's account status changed: \(accountState)")
        }
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        
       user
        .map(\.status)
        .sink { [weak self] state in
            self?.accountState = state
        }
        .store(in: &subscriptions)
    }
    
    deinit {
        print("deinit released AccountViewModel")
    }
}

var viewModel: AccountViewModel? = AccountViewModel()

viewModel?.user.value.status = .inactive

viewModel = nil
