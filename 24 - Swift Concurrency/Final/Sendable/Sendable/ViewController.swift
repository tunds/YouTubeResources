//
//  ViewController.swift
//  Sendable
//
//  Created by Tunde on 11/10/2021.
//

import UIKit

// MARK: - Model

struct Anime: Sendable, Hashable {
    
    let title: String
    var likes = 0
    
    init(title: String) {
        self.title = title
    }
    
    static func == (lhs: Anime, rhs: Anime) -> Bool {
        return lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}

// MARK: - Actor

actor AnimeStore {
    
    private(set) var animes: Set<Anime> = [
        Anime(title: "Boku No Hero Academia"),
        Anime(title: "Baki"),
        Anime(title: "Attack On Titan")
    ]
    
    func like(with title: String) {
       
        guard var anime = getAnime(with: title) else {
            return
        }
        
        anime.likes += 1
        
        commit(anime)
    }
    
    func getAnime(with title: String) -> Anime? {
        animes.first(where: { $0.title == title })
    }
    
    func commit(_ article: Anime) {
        animes.update(with: article)
    }
}

class ViewController: UIViewController {

    private let store = AnimeStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let animeTitle = "Boku No Hero Academia"
        
        Task {
            
            await withTaskGroup(of: Void.self) { group in
                
                for _ in 0..<3000 {
                    group.addTask {
                        await self.store.like(with: animeTitle)
                    }
                }
                
                for _ in 0..<1000 {
                    group.addTask {
                        await self.dislike(with: animeTitle)
                    }
                }
                
            }
            
            await store.animes.forEach { anime in
                    print("\(anime.title) has \(anime.likes) likes")
                }
        }
    }
    
    func dislike(with title: String) async {
        
        guard var anime = await store.getAnime(with: title) else {
            return
        }
        
        anime.likes -= 1
        
        await store.commit(anime)
    }
}
