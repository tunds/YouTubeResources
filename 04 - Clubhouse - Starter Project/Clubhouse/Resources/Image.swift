//
//  Image.swift
//  Clubhouse
//
//  Created by Tunde on 28/02/2021.
//

import SwiftUI

/***
 These are all the images we use in the app, it's a mixture of image assets and sfsymbols
 **/
extension Image {
    
    /*** Image Assets ***/
    static let profile_pic = Image("profile_pic")
    
    /** SFSymbols **/
    static let search = Image(systemName: "magnifyingglass")
    static let invite = Image(systemName: "envelope.open")
    static let calendar = Image(systemName: "calendar")
    static let notificationBell = Image(systemName: "bell")
    static let home = Image(systemName: "house")
    static let grid = Image(systemName: "circle.grid.3x3.fill")
    static let person = Image(systemName: "person.fill")
    static let chatBubble = Image(systemName: "ellipsis.bubble.fill")
    static let back = Image(systemName: "chevron.backward")
    static let down = Image(systemName: "chevron.down")
    static let document = Image(systemName: "doc")
    static let gear = Image(systemName: "gear")
    static let plus = Image(systemName: "plus")
    static let handRaised = Image(systemName: "hand.raised")
    static let ellipsis = Image(systemName: "ellipsis")
    static let star = Image(systemName: "staroflife.fill")
    static let mute = Image(systemName: "speaker.slash.fill")
}
