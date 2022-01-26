//
//  ContentView.swift
//  NewsAPI
//
//  Created by Tunde on 08/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("darkModeEnabled") private var darkModeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false

    private let themeManager = ThemeManager()
    
    var body: some View {
        
        TabView {
            FeedView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("Feed")
                }
            SettingsView(darkModeEnabled: $darkModeEnabled,
                         systemThemeEnabled: $systemThemeEnabled,
                         themeManager: themeManager)
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("Settings")
                }
        }
        .onAppear {
            self.themeManager.handleTheme(darkMode: darkModeEnabled,
                                          system: systemThemeEnabled)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
