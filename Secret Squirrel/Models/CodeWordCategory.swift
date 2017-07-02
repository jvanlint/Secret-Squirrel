//
//  CodeWordCategory.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 2/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import Foundation

struct CodeWordCategory{
    let categoryName: String
    let categoryDesc: String
    let categoryWords: [String]
    
    // Designated initializer
    init(categoryName:String, categoryDesc: String, categoryWords: [String]) {
        self.categoryName = categoryName
        self.categoryDesc = categoryDesc
        self.categoryWords = categoryWords
    }
    
    // Convenience initialiser.
    init(){
        //let tempPath = Bundle.main.path(forResource: "NameData", ofType: "plist")   //Get the path of the plist file
        //let tempDict = NSDictionary(contentsOfFile: tempPath!)
        
        let categoryName = "Load Name here"
        let categoryDescription = "Load a desc here."
        let categoryWords = ["Word One", "Word Two", "etc"]
        
        self.init(categoryName: categoryName, categoryDesc: categoryDescription,  categoryWords: categoryWords)
    }
}
