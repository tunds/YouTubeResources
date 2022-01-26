//
//  PlistManager.swift
//  NewsAPI
//
//  Created by Tunde on 30/03/2021.
//

import Foundation

protocol PlistManager {
    func convert(plist fileName: String) -> [OnboardingItem]
}

class PlistManagerImpl: PlistManager {
    
    func convert(plist fileName: String) -> [OnboardingItem] {
        
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "plist"),
              let data = try? Data(contentsOf: url),
              let items = try? PropertyListDecoder().decode([OnboardingItem].self, from: data) else { return [] }
        
        return items
    }
}

protocol OnboardingContentManager {
    var limit: Int { get }
    var items: [OnboardingItem] { get set }
    init(manager: PlistManager)
}

class OnboardingContentManagerImpl: OnboardingContentManager {
    
    var items: [OnboardingItem] = []

    var limit: Int {
        items.count - 1
    }
    
    required init(manager: PlistManager) {
        self.items = manager.convert(plist: "OnboardingContent")
    }
}
