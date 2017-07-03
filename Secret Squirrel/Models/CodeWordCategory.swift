//
//  CodeWordCategory.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 2/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import Foundation

struct CodeWordCategory {
    let categoryName: String
    let categoryDesc: String
    let categoryWords: [String]
    
    // Designated initializer
    init(categoryName:String, categoryDesc: String, categoryWords: [String]) {
        self.categoryName = categoryName
        self.categoryDesc = categoryDesc
        self.categoryWords = categoryWords
    }
}

struct CodeWordCategories {
    
    var categoriesData:[CodeWordCategory] = []
    
    // Designated initializer
    init(categoryObjects:[CodeWordCategory] ) {
        self.categoriesData = categoryObjects
    }
    
    // Convenience initialiser.
    init(){
        
        var categoryArray:[CodeWordCategory] = []
        
        let tempPath = Bundle.main.path(forResource: "Categories", ofType: "plist")   //Get the path of the plist file
        if let tempArray = NSArray(contentsOfFile:tempPath!) as? [[String : Any]]
        {
            for index in tempArray{
                //print("Value: \(index["Name"])")
                let name = index["Name"] as! String
                let desc = index["Description"] as! String
                let words:[String] = index["Words"] as! [String]
                
                let object=CodeWordCategory.init(categoryName: name, categoryDesc: desc, categoryWords: words)
                categoryArray.append(object)
            }
            
        }
        self.init(categoryObjects: categoryArray)
    }
    
    
    /// Generates a random word from the words for a given category.
    ///
    /// - Parameter category: The category from which the word is required.
    /// - Returns: A random word string.
    func randomWord(fromCategory category:String) -> String{
        var randomWord: String = ""
        
        for categoryObject in self.categoriesData{
            if categoryObject.categoryName == category{
                randomWord = categoryObject.categoryWords.randomItem()
            }
        }
        return randomWord
    }
    
    /// Provides an array of words from the loaded dictionary for a given category.
    ///
    /// - Parameter category: The category for which the array should contain all words.
    /// - Returns: An array of words as strings.
    func arrayOfWords(forCategory category:String) ->[String] {
        var wordArray:[String]=[]
        
        for categoryObject in self.categoriesData{
            if categoryObject.categoryName == category{
                wordArray = categoryObject.categoryWords
            }
        }
        
        return wordArray
    }
    
    /// Provides an array of all the category names from the loaded dictionary.
    ///
    /// - Returns: An array of category names from the dictionary.
    func arrayOfAllCategories() -> [String] {
        var categoryArray: [String] = []
        
        for categoryObject in self.categoriesData{
            categoryArray.append(categoryObject.categoryName)
        }
        
        return categoryArray
    }
    
}

