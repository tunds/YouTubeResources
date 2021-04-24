import UIKit
import Combine

class AccountManager {
    
    enum AccountStatus {
        case active
        case banned
    }
    
    let userAccountStatus = CurrentValueSubject<AccountStatus, Never>(.active)
    
    func set(status: AccountStatus) {
        userAccountStatus.send(status)
    }
}

class CommentsManager {
    
    // Look into throwing errors and then blocking the acccount
    // Look at assigning good words to an array which we will bind to a tableview
    // Binding to a tableview https://trycombine.com/posts/combinedatasources-simple-static-list/
    
    private var warningCount = 0
    private let badWords = ["💩", "🍆"]
    
    private let commentEntered = PassthroughSubject<String, Never>()
    
    private var subscriptions = Set<AnyCancellable>()
    
    let accountManager: AccountManager
    
    init(manager: AccountManager) {
        self.accountManager = manager
        
        commentEntered
            .filter({ [weak self] val in
                guard let self = self else { return false }
                return self.badWords.contains(val)
            })
            .sink(receiveCompletion: { _ in},
                  receiveValue: { [weak self] _ in
                    guard let self = self else { return }

                    self.warningCount += 1
                    if self.warningCount >= 3 {
                        print("Reached Swear word limit")
                        manager.set(status: .banned)
                    } else {
                        print("Relax Bro")
                    }
                  })
                .store(in: &subscriptions)
    }
    
    func send(comment: String) {
        commentEntered.send(comment)
    }
}

let commentsManager = CommentsManager(manager: AccountManager())

commentsManager.send(comment: "🍆")
commentsManager.send(comment: "💩")
commentsManager.send(comment: "🍆")
commentsManager.send(comment: "🍆")

let subscription = commentsManager
    .accountManager
    .userAccountStatus
    .sink { status in
        switch status {
        case .banned:
            print("The user's account is banned")
        default:
            break
        }
    }
