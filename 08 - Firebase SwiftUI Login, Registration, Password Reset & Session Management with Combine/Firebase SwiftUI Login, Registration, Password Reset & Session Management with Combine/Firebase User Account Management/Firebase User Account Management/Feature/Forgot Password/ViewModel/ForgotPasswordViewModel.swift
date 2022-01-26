//
//  ForgotPasswordViewModel.swift
//  Firebase User Account Management
//
//  Created by Tunde on 22/05/2021.
//

import Foundation
import Combine

protocol ForgotPasswordViewModel {
    var service: ForgotPasswordService { get }
    var email: String { get }
    init(service: ForgotPasswordService)
    func sendPasswordResetRequest()
}

final class ForgotPasswordViewModelImpl: ObservableObject, ForgotPasswordViewModel {
    
    let service: ForgotPasswordService
    @Published var email: String = ""

    private var subscriptions = Set<AnyCancellable>()
    
    init(service: ForgotPasswordService) {
        self.service = service
    }
    
    func sendPasswordResetRequest() {
        service
            .sendPasswordResetRequest(to: email)
            .sink { res in
                switch res {
                case .failure(let err):
                    print("Failed: \(err)")
                default: break
                }
            } receiveValue: {
                print("Sending request..")
            }
            .store(in: &subscriptions)
    }
}
