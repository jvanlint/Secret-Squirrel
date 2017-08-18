//
//  AppDelegate.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 29/6/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Set font for nav bar buttons.
        UIBarButtonItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Avenir", size: 15)!], for: .normal)
        
        // Load saved categories for code name generation from disk.
        AppController.sharedInstance.loadCategoryPreferencesFromDisk()
        return true
    }
}

