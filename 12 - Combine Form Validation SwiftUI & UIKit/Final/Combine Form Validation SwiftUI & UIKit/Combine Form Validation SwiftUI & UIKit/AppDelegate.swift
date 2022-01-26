//
//  AppDelegate.swift
//  Combine Form Validation SwiftUI & UIKit
//
//  Created by Tunde on 03/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let regexItems = [
//            RegexFormItem(pattern: RegexPatterns.emailChars,
//                          error: .custom(message: "Invalid Email missing @")),
//            RegexFormItem(pattern: RegexPatterns.higherThanSixChars,
//                          error: .custom(message: "Less than 6 characters"))
//        ]
        
        let regexItems = [
            RegexFormItem(pattern: RegexPatterns.name,
                          error: .custom(message: "Invalid Name"))
        ]
        
//        let manager = RegexValidationManagerImpl(regexItems)
//
//        do {
//            let isValid = try manager.validate("tunde ")
//            print(isValid)
//        } catch {
//            print(error)
//        }
        
        
        let dateManager = DateValidationManagerImpl()
        
        do {
            let myBirthday = Date(timeIntervalSince1970: 783277099)
            let isValid = try dateManager.validate(Date(timeIntervalSince1970: 1130432299000))
            print(isValid)
        } catch {
            print(error)
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

