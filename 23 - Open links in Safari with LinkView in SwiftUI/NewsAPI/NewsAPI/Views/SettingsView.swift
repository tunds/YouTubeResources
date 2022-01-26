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
                  
                    Link(destination: URL(string: Constants.twitter)!) {
                            Label("Follow me on Twitter @tundsdev", systemImage: "link")
                    }
                    
                    Link("Contact me via email",
                         destination: URL(string: Constants.email)!)
                    
                    Link("Call me",
                         destination: URL(string: Constants.phone)!)
                    
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
