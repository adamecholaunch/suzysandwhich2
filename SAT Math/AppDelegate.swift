//
//  AppDelegate.swift
//  SAT Math
//
//  Created by Adam Buys on 6/17/17.
//  Copyright © 2017 Adam Buys. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let appID = "UCZiRGHXwhPlcl60s3qawvuxkmHup0eDiJmi1ME5"
    let clientKey = "SMmpteuRiAPAsOnIPOtegJH4GxAFLxy9olpjHS45"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let configuration = ParseClientConfiguration {
            $0.applicationId = self.appID
            $0.clientKey = self.clientKey
            $0.server = "https://parseapi.back4app.com"
            $0.isLocalDatastoreEnabled = true // If you need to enable local data store
        }
        Parse.initialize(with: configuration)
        
        let problemQuery = PFQuery(className:"Problem")
        problemQuery.limit = 3
        problemQuery.findObjectsInBackground(block: { (objects, error) -> Void in
            
            if (error == nil) {
                print("Success")
                
                if (objects != nil) {
                    for object in objects! {
                        if object["mcA"] != nil {
                            print(object["mcA"]!)
                        }
                    }
                }
                
            } else {
                print("Error")
            }
        })
        
    
            
        
        
        return true
    }



}

