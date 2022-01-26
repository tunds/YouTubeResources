//
//  FeedView.swift
//  NewsAPI
//
//  Created by Tunde on 17/02/2021.
//

import SwiftUI
import Combine

struct FeedView: View {
    
    @StateObject var viewModel: ArticleViewModelImpl = ArticleViewModelImpl(service: ArticleServiceImpl())
    
    @State private var showSafariView = false
    
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
                                showSafariView = true
                            }
                            .sheet(isPresented: $showSafariView) {
                                if let stringUrl = article.url,
                                   let url = URL(string: stringUrl) {
                                    SFSafariView(url: url)
                                }
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
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
