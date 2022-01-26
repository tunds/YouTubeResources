//
//  SettingsView.swift
//  NewsAPI
//
//  Created by Tunde on 17/02/2021.
//

import SwiftUI
import UIKit

enum Constants {
    static let twitter = "https://twitter.com/tundsdev"
    static let email = "mailto:foo@bar.com"
    static let phone = "tel:07000000000"
}

struct SettingsView: View {
    
    @Binding var darkModeEnabled: Bool
    @Binding var systemThemeEnabled: Bool

    let themeManager: ThemeManager
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Display"),
                        footer: Text("System settings will override Dark Mode and use the current device theme")) {
                    Toggle(isOn: $darkModeEnabled,
                           label: {
                            Text("Dark mode")
                           })
                        .onChange(of: darkModeEnabled,
                                  perform: { _ in
                                    themeManager.handleTheme(darkMode: darkModeEnabled,
                                                                  system: systemThemeEnabled)
                                    
                                  })
                    Toggle(isOn: $systemThemeEnabled,
                           label: {
                            Text("Use system settings")
                           })
                        .onChange(of: systemThemeEnabled,
                                  perform: { _ in
                                    themeManager.handleTheme(darkMode: darkModeEnabled,
                                                                  system: systemThemeEnabled)
                                    
                                  })
                }
                
                Section {
                    Link(destination: URL(string: Constants.twitter)!,
                         label: {
                            Label("Follow me on Twitter @tundsdev", systemImage: "link")
                    })
                    
                    Link("Contact me via email",
                         destination: URL(string: Constants.email)!)
                    
                    Link("Call me",
                         destination: URL(string: Constants.phone)!)
                }
                .foregroundColor(Theme.textColor)
                .font(.system(size: 16, weight: .semibold))
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(darkModeEnabled: .constant(false),
                     systemThemeEnabled: .constant(false),
                     themeManager: ThemeManager())
    }
}

class ThemeManager {
    
    func handleTheme(darkMode: Bool, system: Bool) {
        
        guard !system else {
            UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
            return
        }
        
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
}
