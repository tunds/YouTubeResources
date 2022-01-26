//
//  Font.swift
//  Clubhouse
//
//  Created by Tunde on 28/02/2021.
//

import SwiftUI

extension Font {
    
    struct Nunito {
        
        /// Get NunitoSans-ExtraBold with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func extraBold(size: CGFloat) -> Font {
            .custom("NunitoSans-ExtraBold", size: size)
        }
        
        /// Get NunitoSans-Bold with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func bold(size: CGFloat) -> Font {
            .custom("NunitoSans-Bold", size: size)
        }
        
        /// Get NunitoSans-SemiBold with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func semiBold(size: CGFloat) -> Font {
            .custom("NunitoSans-SemiBold", size: size)
        }
        
        /// Get NunitoSans-Regular with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func regular(size: CGFloat) -> Font {
            .custom("NunitoSans-Regular", size: size)
        }
    }
}
