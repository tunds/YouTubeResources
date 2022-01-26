//
//  OnboardingItem.swift
//  Onboarding
//
//  Created by Tunde on 04/04/2021.
//

import Foundation

struct OnboardingItem: Identifiable {

    let id = UUID()
    var title: String?
    var content: String?
    var asset: Asset?

    init(title: String? = nil,
         content: String? = nil,
         asset: Asset? = nil) {
        self.title = title
        self.content = content
        self.asset = asset
    }
}
