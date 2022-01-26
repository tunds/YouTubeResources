//
//  SettingsView.swift
//  NewsAPI
//
//  Created by Tunde on 17/02/2021.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Display"),
                        footer: Text("System settings will override Dark Mode and use the current device theme")) {
                    Toggle(isOn: .constant(false),
                           label: {
                        Text("Dark mode")
                    })
                    Toggle(isOn: .constant(false),
                           label: {
                        Text("Use system settings")
                    })
                }
                
                Section {
                    Label("Follow me on Twitter @tundsdev", systemImage: "link")
                }
                .foregroundColor(.black)
                .font(.system(size: 16, weight: .semibold))
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
