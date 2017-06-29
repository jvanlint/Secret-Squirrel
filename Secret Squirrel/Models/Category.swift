//
//  Category.swift
//  CodeNameGenerator
//
//  Created by Jason van Lint on 11/1/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import Foundation

struct Category{

    let path: String
    let dict: NSDictionary
    
    // Designated initializer
    init(path:String, dict: NSDictionary) {
        self.path = path
        self.dict = dict
    }
    
    // Convenience initialiser.
    init(){
        let tempPath = Bundle.main.path(forResource: "NameData", ofType: "plist")   //Get the path of the plist file
        let tempDict = NSDictionary(contentsOfFile: tempPath!)
        
        self.init(path: tempPath!, dict: tempDict!)
    }
    
    /// Generates a random word from the loaded dictionary for a given category.
    ///
    /// - Parameter category: The category from which the word is required.
    /// - Returns: A random word string.
    func randomWord(fromCategory category:String) -> String{
        let wordArray = dict[category] as! Array<String>
        return wordArray.randomItem()
    }
    
    /// Provides an array of words from the loaded dictionary for a given category.
    ///
    /// - Parameter category: The category for which the array should contain all words.
    /// - Returns: An array of words as strings.
    func arrayOfWords(forCategory category:String) ->[String] {
        return dict[category] as! Array<String>
    }
    
    /// Provides an array of all the category names from the loaded dictionary.
    ///
    /// - Returns: An array of category names from the dictionary.
    func arrayOfAllCategories() -> [String] {
        var categoryArray: [String] = []
        
        for categoryName in (dict.allKeys){
            categoryArray.append(categoryName as! String)
        }
        return categoryArray
    }
}
