//
//  AppDelegate.swift
//  ImplusPurchasesExample
//
//  Created by Vilius Padleckis on 2020-09-28.
//  Copyright © 2020 Implus.co. All rights reserved.
//

import UIKit
import ImplusPurchases
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IMPurchase.shared.enableLog(true)
        IMPurchase.shared.configure("eyJhbGciOiJSUzI1NiIsImtpZCI6ImFoYzZ6c3I5azIiLCJ0eXAiOiJKV1QifQ.eyJhdWQiOiIwNzEwMzAyNy1mNGYzLTQwM2QtYjBkOC1hNzJhMzkwZTFjNDUiLCJpYXQiOjE1OTkzOTk2OTYsImlzcyI6ImFwcGZsb3cuYWkiLCJzdWIiOiJjMTI3YTEzYy1hZDg2LTQxNjEtYmUwMy0wODkwZmY5MmVjMDciLCJ0eXBlIjoiYXBwIn0.xX0OT2SyJSbRmg4FHKRpmncDJhWQ5bmSsvZZgbdBpM-0z1w2mndwnI3qIcKJTKjf9MtlX16QdVdVgkIWNqb3HSGaSaVQnmhy51ncKl7TUjy9_l5adFo_0FulFGa2Ik2n6abpKr4s_APdb3Qatkcox7Jxmb4Us71cOcWmn7epRgGhIZqrLrnINSOTJlRMgIcIGr8TIWe1ZuT3Bim4pLZgnx5shqYvhn_F-kD4y71-PbX5-WfEFA1tZ5QV5aM25JmXNxyy2RczeB2Y2-1cWmMXwcrY89Xw33XOzhKIw-mdgcLSOQi0R3N8K5bCWLHcw0VAycU0iJwcJXcIEUUs8Vm3jw")
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

