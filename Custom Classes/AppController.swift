//
//  AppController.swift
//  pocketKPI
//
//  Created by Jason van Lint on 12/11/15.
//  Copyright © 2015 Dead Frog Studios. All rights reserved.
//

import UIKit

/// Defines an app wide controller that provides common methods
///
/// - Note: This uses a singleton pattern to provide cross app access to variables and commone methods.
class AppController: NSObject {
    
    static let sharedInstance = AppController()
    
    //MARK: - Variable Declarations
    
   var currentDashboardIndex = 0
    
    //MARK: - App Versioning Methods
    
    /// Provides the short version string of the application. eg. 1.00
    ///
    /// - returns: A string containing the short version of the application.
    func appVersion() -> String{
        
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String{
            return version
        }else{
            return "No version available."
        }
    }
    
    /// Provides the build version string of the application. eg. 1
    ///
    /// - returns: A string containing the build version of the application.
    func appBuildNumber() -> String{
        
        if let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            return build
        }else{
            return "No build available."
        }
    }
    
    /// Provides human readable version of app version. eg. Version:2.0.1 Build:1
    ///
    /// - returns: A formatted string containing the version and build number of the application.
    func appVersionString() -> String{
        
        let versionString:String = "Version:\(appVersion())\nBuild:\(appBuildNumber())"     //eg. Version:1.0.1 Build:(20)
        return versionString
    }
    
    //MARK: - App Preferences Management
    
    func savePreferencesToDisk(){
        let defaults = UserDefaults.standard
        
        defaults.set(self.currentDashboardIndex, forKey: "CurrentDashboardIndex")
        
    }
    
    func loadPreferencesFromDisk(){
        let defaults = UserDefaults.standard
        
        let defaultIndex = defaults.integer(forKey: "CurrentDashboardIndex")
        
        self.currentDashboardIndex = defaultIndex
        
        
    }
}
