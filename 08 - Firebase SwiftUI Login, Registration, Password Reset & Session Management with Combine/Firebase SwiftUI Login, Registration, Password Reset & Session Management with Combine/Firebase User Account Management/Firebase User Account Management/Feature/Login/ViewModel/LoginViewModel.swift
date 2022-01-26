//
//  LoginViewModel.swift
//  Firebase User Account Management
//
//  Created by Tunde on 22/05/2021.
//

import Foundation
import Combine
import SwiftUI

protocol LoginViewModel {
    func login()
    var service: LoginService { get }
    var state: LoginState { get }
    var hasError: Bool { get }
    var credentials: LoginCredentials { get }
    init(service: LoginService)
}

enum LoginState {
    case successfullyLoggedIn
    case failed(error: Error)
    case na
}

final class LoginViewModelImpl: ObservableObject, LoginViewModel {
    
    let service: LoginService
    @Published var state: LoginState = .na
    @Published var credentials: LoginCredentials = LoginCredentials(email: "",
                                                                    password: "")
    @Published var hasError: Bool = false
    
    private var subscriptions = Set<AnyCancellable>()
    
    init(service: LoginService) {
        self.service = service
        setupErrorSubscription()
    }
    
    func login() {
        service
            .login(with: credentials)
            .sink { res in
                switch res {
                case .failure(let err):
                    self.state = .failed(error: err)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfullyLoggedIn
            }
            .store(in: &subscriptions)
    }
}

private extension LoginViewModelImpl {
    
    func setupErrorSubscription() {
        $state
            .map { state -> Bool in
                switch state {
                case .successfullyLoggedIn,
                     .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
