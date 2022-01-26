//
//  Firebase_SPM_installationApp.swift
//  Firebase SPM installation
//
//  Created by Tunde on 20/05/2021.
//

import SwiftUI
import Firebase

/**
 * App Delegate
 */

final class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

/**
 * Entry Point
 */
@main
struct Firebase_SPM_installationApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
