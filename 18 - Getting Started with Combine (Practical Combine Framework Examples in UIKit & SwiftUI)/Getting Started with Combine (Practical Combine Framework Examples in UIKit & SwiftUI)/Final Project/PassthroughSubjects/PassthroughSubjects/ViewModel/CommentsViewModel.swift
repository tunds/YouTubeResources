//
//  CommentsViewModel.swift
//  PassthroughSubjects
//
//  Created by Tunde on 17/04/2021.
//

import Foundation
import Combine

final class CommentsViewModel {
    
    private let commentEntered = PassthroughSubject<String, Error>()
    private var subscriptions = Set<AnyCancellable>()
    
    private let badWords = ["💩", "🍆"]

    private let manager: AccountViewModel
    
    init(manager: AccountViewModel) {
        self.manager = manager
        setupSubscription()
    }
    
    func send(comment: String) {
        commentEntered.send(comment)
    }
}

private extension CommentsViewModel {
    
    func setupSubscription() {
        
        commentEntered
            .filter({ !$0.isEmpty })
            .sink(receiveCompletion: { _ in })
            { [weak self] val in
                
                guard let self = self else { return }
                if self.badWords.contains(val) {
                    self.manager.increaseWarning()
                } else {
                    print("New Comment: \(val)")
                }
            }
            .store(in: &subscriptions)
    }
}
