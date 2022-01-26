//
//  ArticleViewModel.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import Foundation
import Combine

protocol ArticleViewModel {
    func getArticles()
}

enum ResultState {
    case loading
    case failed(error: Error)
    case success(content: [Article])
}


class ArticleViewModelImpl: ObservableObject, ArticleViewModel {
    
    private let service: ArticleService

    private(set) var articles = [Article]()
    @Published private(set) var state: ResultState = .loading

    private var cancellables = Set<AnyCancellable>()

    init(service: ArticleService) {
        self.service = service
    }
    
    func getArticles() {
  
        self.state = .loading
        
        let cancellable = self.service
            .request(from: .getNews)
            .sink { (res) in
                switch res {
                case .failure(let error):
                    self.state = .failed(error: error)
                case .finished:
                    self.state = .success(content: self.articles)
                }
            } receiveValue: { res in
                self.articles = res.articles
            }
        self.cancellables.insert(cancellable)
    }
}
