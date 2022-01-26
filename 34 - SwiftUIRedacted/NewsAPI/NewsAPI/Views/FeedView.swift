//
//  FeedView.swift
//  NewsAPI
//
//  Created by Tunde on 17/02/2021.
//

import SwiftUI
import Combine

struct FeedView: View {
    
    @Environment(\.openURL) var openURL
    @StateObject var viewModel: ArticleViewModelImpl = ArticleViewModelImpl(service: ArticleServiceImpl())
    
    
    var body: some View {
        NavigationView {
            
            Group {
                
                switch viewModel.state {

                case .failed(let error):
                    ErrorView(error: error) {
                        self.viewModel.getArticles()
                    }
                    
                    
                default:
                    List(viewModel.isLoading ? Article.dummyData : viewModel.articles) { article in
                        ArticleView(isLoading: viewModel.isLoading,
                                    article: article)
                            .onTapGesture {
                                load(url: article.url)
                            }
                    }
                    .navigationBarTitle("News")
    
                }
            }
        }
        .onAppear {
            print("FeedView has appeared")
            self.viewModel.getArticles()
        }
    }
    
    func load(url: String?) {
        guard let url = url,
              let linkUrl = URL(string: url) else {
            return
        }
        openURL(linkUrl)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
