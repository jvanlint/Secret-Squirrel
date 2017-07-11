//
//  CodeName.swift
//  CodeNameGenerator
//
//  Created by Jason van Lint on 12/09/2016.
//  Copyright © 2016 Dead Frog Studios. All rights reserved.
//

import Foundation

struct CodeName{
    
    let prefix: String
    let middle: String
    let suffix: String
    
    // MARK: - Computed Properties
    
    var codeNameString: String {
        
        // Declare a var that store the built up string
        var codeString: String = ""
        
        // Build the string piece by piece ignoring any category that is "None".
        if !(self.prefix==""){
            codeString = codeString + self.prefix
        }
        if !(self.middle==""){
            if !(self.prefix==""){
                codeString = codeString + " " + self.middle
            }else{
                codeString = codeString + self.middle
            }
        }
        if !(self.suffix==""){
            codeString = codeString + " " + self.suffix
        }
        
        return codeString
    }
    
    // MARK: - Initializers
    
    // Designated initializer
    init(prefix: String, middle: String, suffix:String) {
        self.prefix = prefix.capitalized
        
        // FIXME: - Middle needs to cater for nils and should be optional.
        self.middle = middle.capitalized
        self.suffix = suffix.capitalized
    }
    
    
    /// Convenience initaliser that will return a CodeName object with initialised properties.
    ///
    /// - returns: A CodeName object with values generated from referencing user selected categories stored in the AppController.
    init(){
        
        let categoryData = CodeWordCategories()                         //Create a Category object that loads the categories from disk.
        
        let storedPrefix = AppController.sharedInstance.prefix          // Get the app wide prefix category from the AppController.
        let storedMiddle = AppController.sharedInstance.middle          // Get the app wide middle category from the AppController.
        let storedSuffix = AppController.sharedInstance.suffix          // Get the app wide suffix category from the AppController.
        
        // Initialise this object with random words from each category specified.
        self.init(prefix: categoryData.randomWord(fromCategory: storedPrefix), middle: categoryData.randomWord(fromCategory: storedMiddle), suffix: categoryData.randomWord(fromCategory: storedSuffix))
    }
}
