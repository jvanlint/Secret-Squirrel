//
//  Theme.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 5/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import Foundation

struct Theme{
    var name: String
    var description: String
    var type: String
    var categories: (prefix:String, middle:String, suffix:String)
    
    // MARK: - Initializers
    
    // Designated initializer
    init(name: String, description: String, type: String, categories: (String, String, String)) {
        self.name = name
        self.description = description
        self.type = type
        self.categories = categories
    }
}

struct Themes{
    var themesList: [Theme]
    
    // Designated initialiser
    init(themesList: [Theme]){
        self.themesList = themesList
    }
    
    // Convenience initialiser
    init(){
        var themesArray:[Theme] = []
        
        let tempPath = Bundle.main.path(forResource: "Themes", ofType: "plist")   //Get the path of the plist file
        if let tempArray = NSArray(contentsOfFile:tempPath!) as? [[String : Any]]
        {
            for index in tempArray{
                let tempName = index["themeName"] as! String
                let tempDesc = index["themeDescription"] as! String
                let tempType = index["themeType"] as! String
                let tempCategories = (prefix: index["prefix"] as! String, middle: index["middle"] as! String, suffix: index["suffix"] as! String)
                
                let object = Theme.init(name: tempName, description: tempDesc, type: tempType, categories: tempCategories)
                themesArray.append(object)
            }
            
        }
        self.init(themesList: themesArray)
    }
    
}
