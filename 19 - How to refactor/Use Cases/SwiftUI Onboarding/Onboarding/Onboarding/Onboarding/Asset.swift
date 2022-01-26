//
//  Asset.swift
//  Onboarding
//
//  Created by Tunde on 28/05/2021.
//

import Foundation
import SwiftUI

enum AssetType: String, Codable {
    case sfSymbol
    case image
}

struct Asset: Codable {
    let name: String
    let type: AssetType
}

extension Asset {
    
    @ViewBuilder
    var content: some View {
                       
            switch type {
            case .sfSymbol:
                Image(systemName: name)
                    .padding(.bottom, 50)
                    .font(.system(size: 120, weight: .bold))
            case .image:
                
            VStack {
                    Spacer()
                    Image(name)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity,
                               maxHeight: 150,
                               alignment: .bottom)
                        .padding(.bottom, 50)
                }
            }
    }
}
