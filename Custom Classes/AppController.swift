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
    
    var prefix: String = "Colors"
    var middle: String = "Metals"
    var suffix: String = "Snakes"
    
    var currentThemeIndex = 2
    
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
        
        let versionString:String = "Version:\(appVersion())\nBuild:\(appBuildNumber())"
        return versionString
    }
    
    //MARK: - App Preferences Management
    
    func saveCategoryPreferencesToDisk(){
        let defaults = UserDefaults.standard
        
        defaults.set(self.prefix, forKey: "Prefix")
        defaults.set(self.middle, forKey: "Middle")
        defaults.set(self.suffix, forKey: "Suffix")
        
    }
    
    func loadCategoryPreferencesFromDisk(){
        let defaults = UserDefaults.standard
        
        if let prefix = defaults.string(forKey: "Prefix") {
            self.prefix = prefix
        } else {
            self.prefix = "Colors"
        }
        
        if let middle = defaults.string(forKey: "Middle"){
            self.middle = middle
        }else{
            self.middle = "Metals"
        }
        
        if let suffix = defaults.string(forKey: "Suffix"){
            self.suffix = suffix
        }else{
            self.suffix = "Snakes"
        }
        
    }
}
