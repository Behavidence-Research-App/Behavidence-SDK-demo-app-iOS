//
//  AppDelegate.swift
//  Behavidence-SDK-demo-app-iOS
//
//  Created by Ela Kliots Shapira on 23/7/24.
//

import UIKit
import BehavidenceSDK

let PRIVATE_API_KEY = ""

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        BehavidenceSDK.SetApiKey(key: PRIVATE_API_KEY)
        
        BehavidenceSDK.Setup { error, loggedIn in
            if (error == nil) {
                BehavidenceSDK.GetAllScores() { data in
                    print("MHSS - OK")
                }
            }
            else {
                print("ERROR:", error ?? "- unknown error -")
            }
        }
        
        BehavidenceSDK.Refresh()
        
        return true
    }
}
