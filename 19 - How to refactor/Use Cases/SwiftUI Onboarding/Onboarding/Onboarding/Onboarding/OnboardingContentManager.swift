//
//  OnboardingContentManager.swift
//  Onboarding
//
//  Created by Tunde on 04/04/2021.
//

import Foundation

protocol OnboardingContentManager {
    var limit: Int { get }
    var items: [OnboardingItem] { get }
}

final class OnboardingContentManagerImpl: OnboardingContentManager {
    
    var limit: Int {
        items.count - 1
    }
    
    let items: [OnboardingItem] = [
        
        OnboardingItem(title: "Bookmark",
                       content: "Bookmark your favourite items and view them later",
                       asset: Asset(name: "bookmark",
                                    type: .sfSymbol)),
        
        OnboardingItem(title: "Customize",
                       content: "Configure and change the view to your liking",
                       asset: Asset(name: "gearshape",
                                    type: .sfSymbol)),
        
        OnboardingItem(title: "Support",
                       content: "Show the developer some love since it's a single developer 💕",
                       asset: Asset(name: "heart",
                                    type: .sfSymbol)),
        
        OnboardingItem(title: "Coming Soon",
                       content: "We've got some new features coming soon",
                       asset: Asset(name: "stars",
                                    type: .image))
    
    ]
}
