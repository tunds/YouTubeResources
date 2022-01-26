//
//  Article.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import Foundation

struct ArticleResponse: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable, Equatable {

    let id: UUID = UUID()
    var author: String?
    var url: String?
    var source: String?
    var title: String?
    var welcomeDescription: String?
    var image: String?
    var date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title, image, date
        case welcomeDescription = "description"
    }
}

extension Article {
    
    static var dummyData: [Article] {
        [
            .init(author: "Adam Edelman, Monica Alba, Frank Thorp V, Alex Moe",
                  url: "https://www.nbcnews.com/politics/donald-trump/trump-impeachment-trial-day-2-kicks-case-against-him-n1257246",
                  source: "NBC News",
                  title: "Never-seen-before security video of Capitol riot to open Trump impeachment trial Day 2 - NBC News",
                  welcomeDescription: "Dems to open Day 2 trial arguments against Trump with 'never-seen-before\" riot footage",
                  image: "https://media2.s-nbcnews.com/j/newscms/2021_06/3448074/210205-impeachment-main-bar-cs-428p_fcaf4fdb04ac2ff3682a3783343f300b.nbcnews-fp-1200-630.jpg",
                  date: Date()),
            .init(author: "Adam Edelman, Monica Alba, Frank Thorp V, Alex Moe",
                  url: "https://www.nbcnews.com/politics/donald-trump/trump-impeachment-trial-day-2-kicks-case-against-him-n1257246",
                  source: "NBC News",
                  title: "Never-seen-before security video of Capitol riot to open Trump impeachment trial Day 2 - NBC News",
                  welcomeDescription: "Dems to open Day 2 trial arguments against Trump with 'never-seen-before\" riot footage",
                  image: "https://media2.s-nbcnews.com/j/newscms/2021_06/3448074/210205-impeachment-main-bar-cs-428p_fcaf4fdb04ac2ff3682a3783343f300b.nbcnews-fp-1200-630.jpg",
                  date: Date()),
            .init(author: "Adam Edelman, Monica Alba, Frank Thorp V, Alex Moe",
                  url: "https://www.nbcnews.com/politics/donald-trump/trump-impeachment-trial-day-2-kicks-case-against-him-n1257246",
                  source: "NBC News",
                  title: "Never-seen-before security video of Capitol riot to open Trump impeachment trial Day 2 - NBC News",
                  welcomeDescription: "Dems to open Day 2 trial arguments against Trump with 'never-seen-before\" riot footage",
                  image: "https://media2.s-nbcnews.com/j/newscms/2021_06/3448074/210205-impeachment-main-bar-cs-428p_fcaf4fdb04ac2ff3682a3783343f300b.nbcnews-fp-1200-630.jpg",
                  date: Date()),
            .init(author: "Adam Edelman, Monica Alba, Frank Thorp V, Alex Moe",
                  url: "https://www.nbcnews.com/politics/donald-trump/trump-impeachment-trial-day-2-kicks-case-against-him-n1257246",
                  source: "NBC News",
                  title: "Never-seen-before security video of Capitol riot to open Trump impeachment trial Day 2 - NBC News",
                  welcomeDescription: "Dems to open Day 2 trial arguments against Trump with 'never-seen-before\" riot footage",
                  image: "https://media2.s-nbcnews.com/j/newscms/2021_06/3448074/210205-impeachment-main-bar-cs-428p_fcaf4fdb04ac2ff3682a3783343f300b.nbcnews-fp-1200-630.jpg",
                  date: Date()),
            .init(author: "Adam Edelman, Monica Alba, Frank Thorp V, Alex Moe",
                  url: "https://www.nbcnews.com/politics/donald-trump/trump-impeachment-trial-day-2-kicks-case-against-him-n1257246",
                  source: "NBC News",
                  title: "Never-seen-before security video of Capitol riot to open Trump impeachment trial Day 2 - NBC News",
                  welcomeDescription: "Dems to open Day 2 trial arguments against Trump with 'never-seen-before\" riot footage",
                  image: "https://media2.s-nbcnews.com/j/newscms/2021_06/3448074/210205-impeachment-main-bar-cs-428p_fcaf4fdb04ac2ff3682a3783343f300b.nbcnews-fp-1200-630.jpg",
                  date: Date()),
            .init(author: "Adam Edelman, Monica Alba, Frank Thorp V, Alex Moe",
                  url: "https://www.nbcnews.com/politics/donald-trump/trump-impeachment-trial-day-2-kicks-case-against-him-n1257246",
                  source: "NBC News",
                  title: "Never-seen-before security video of Capitol riot to open Trump impeachment trial Day 2 - NBC News",
                  welcomeDescription: "Dems to open Day 2 trial arguments against Trump with 'never-seen-before\" riot footage",
                  image: "https://media2.s-nbcnews.com/j/newscms/2021_06/3448074/210205-impeachment-main-bar-cs-428p_fcaf4fdb04ac2ff3682a3783343f300b.nbcnews-fp-1200-630.jpg",
                  date: Date())
        ]
    }
}
