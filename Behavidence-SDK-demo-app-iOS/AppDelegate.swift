//
//  AppDelegate.swift
//  Behavidence-SDK-demo-app-iOS
//
//  Created by Ela Kliots Shapira on 23/7/24.
//

import UIKit
import BehavidenceSDK

let PRIVATE_API_KEY = ""
let ASSOCIATION_CODE = ""

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
        
        BehavidenceSDK.AssociateUserToCode(code: ASSOCIATION_CODE) { error in
            if (error == nil) {
                print("Association - OK")
            }
            else {
                print("ERROR:", error ?? "- unknown error -")
            }
        }
        
        BehavidenceSDK.GetAssociations() { data in
            if (data != nil) {
                let list = data!
                for association in list {
                    let code = association["code"] as! String
                    if (code == ASSOCIATION_CODE) {
                        let assID = association["associationID"] as! String
                        BehavidenceSDK.DisassociateUserFromCode(associationID: assID) { error in
                            if (error == nil) {
                                print("Disconnect - OK")
                            }
                            else {
                                print("ERROR:", error ?? "- unknown error -")
                            }
                        }
                    }
                }
            }
        }
        
        return true
    }
}
