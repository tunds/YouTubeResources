//
//  ArticleView.swift
//  NewsAPI
//
//  Created by Tunde on 10/02/2021.
//

import SwiftUI
import UIKit
import URLImage

struct ArticleView: View {

    @State var isLoading: Bool
    
    let article: Article
    
    var body: some View {
        HStack {
            // TODO: Add image view
            if let image = article.image,
               let url = URL(string: image){
               
                URLImage(url: url,
                         options: URLImageOptions(
                            identifier: article.id.uuidString,      // Custom identifier
                            cachePolicy: .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.25) // Return cached image or download after delay
                                          ),
                         failure: { error, retry in         // Display error and retry button
                            Image(systemName: "photo.fill")
                                .foregroundColor(.white)
                                .background(Color.gray)
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                         },
                         content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                         })
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo.fill")
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }

            VStack(alignment: .leading, spacing: 4) {
                
                Text(article.title ?? "")
                    .foregroundColor(Theme.textColor)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "")
                    .foregroundColor(.gray)
                    .font(.system(size: 12, weight: .regular))
                    
                if let date = article.date {
                    HStack(spacing: 4) {
                        Text(date, style: .date)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .bold))
                        Text(date, style: .time)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                    }

                }
            }
        }
        .redacted(reason: isLoading ? .placeholder : [])
        .allowsHitTesting(!isLoading)        
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(isLoading: false,
                    article: Article.dummyData.first!)
            .previewLayout(.sizeThatFits)
    }
}
