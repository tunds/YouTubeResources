//
//  RegistrationViewModel.swift
//  Firebase User Account Management
//
//  Created by Tunde on 22/05/2021.
//

import Foundation
import Combine

enum RegistrationState {
    case successfullyRegistered
    case failed(error: Error)
    case na
}

protocol RegistrationViewModel {
    func create()
    var service: RegistrationService { get }
    var state: RegistrationState { get }
    var hasError: Bool { get }
    var newUser: RegistrationCredentials { get }
    init(service: RegistrationService)
}

final class RegistrationViewModelImpl: ObservableObject, RegistrationViewModel {
    
    let service: RegistrationService
    @Published var state: RegistrationState = .na
    @Published var newUser = RegistrationCredentials(email: "",
                                                     password: "",
                                                     firstName: "",
                                                     lastName: "",
                                                     occupation: "")
    @Published var hasError: Bool = false

    private var subscriptions = Set<AnyCancellable>()
    
    init(service: RegistrationService) {
        self.service = service
        setupErrorSubscription()
    }
    
    func create() {
                
        service
            .register(with: newUser)
            .sink { [weak self] res in
            
                switch res {
                case .failure(let error):
                    self?.state = .failed(error: error)
                default: break
                }
            } receiveValue: { [weak self] in
                self?.state = .successfullyRegistered
            }
            .store(in: &subscriptions)
    }
}

private extension RegistrationViewModelImpl {
    
    func setupErrorSubscription() {
        $state
            .map { state -> Bool in
                switch state {
                case .successfullyRegistered,
                     .na:
                    return false
                case .failed:
                    return true
                }
            }
            .assign(to: &$hasError)
    }
}
