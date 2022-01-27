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
    
    static var dummyArticles: [Article] {
        Array(repeating: Article(
            author: "Andrew E. Kramer",
            url: "https://www.nytimes.com/live/2022/01/27/world/ukraine-russia-us",
            source: "New York Times",
            title: "Latest on Russia-Ukraine Tensions: Live Updates - The New York Times",
            articleDescription: "There was no immediate sign of a connection between the shooting and Russia’s military buildup at the border. The incident came hours after the U.S. offered a written response to Russian demands over Eastern Europe.",
            image: "https://static01.nyt.com/images/2022/01/27/world/27ukraine-shooting-01/27ukraine-shooting-01-facebookJumbo.jpg",
            date: Date()
        ), count: 10)
    }
    
}

