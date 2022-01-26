//
//  View+Preview.swift
//  View+Preview
//
//  Created by Tunde on 20/07/2021.
//

import SwiftUI

struct PreviewComponentModifier: ViewModifier {
    
    let displayName: String
    
    func body(content: Content) -> some View {
        content
            .previewDisplayName(displayName)
            .previewLayout(.sizeThatFits)
    }
}

extension View {
    
    func preview(displayName: String = "") -> some View {
        self.modifier(PreviewComponentModifier(displayName: displayName))
    }
}
