//
//  CodeWordCategory.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 2/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import Foundation

class CodeWordCategory: Codable {
    
    //MARK: - Properties
    let categoryName: String
    let categoryDesc: String
    var categoryWords: [String]
    let categoryImage: String
    
    
    private enum CodingKeys: String, CodingKey {
        case categoryName = "Name"
        case categoryDesc = "Description"
        case categoryWords = "Words"
        case categoryImage = "Image"
    }
    
    // MARK: - Initializers
    
    // Designated initializer
    init(categoryName:String, categoryDesc: String, categoryWords: [String], categoryImage: String) {
        self.categoryName = categoryName
        self.categoryDesc = categoryDesc
        self.categoryWords = categoryWords
        self.categoryImage = categoryImage
    }
}

class CodeWordCategories: Codable {
    
    //MARK: - Properties
    var categoriesData:[CodeWordCategory]
    
    // MARK: - Initializers
    
    // Designated initializer
    init(categoryObjects:[CodeWordCategory] ) {
        self.categoriesData = categoryObjects
    }
    
    // Convenience initialiser.
    convenience init(){
        
        var categoryArray:[CodeWordCategory] = []
        
        let fileName = "UserCategories"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let UserCategoriesURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("plist")
        var fileURL: URL
        
        if try! UserCategoriesURL.checkResourceIsReachable(){
            fileURL = UserCategoriesURL
        } else {
            fileURL = Bundle.main.url(forResource: "Categories", withExtension: "plist")!
        }
        
        
        if let data = try? Data(contentsOf: fileURL) {
            let decoder = PropertyListDecoder()
            categoryArray = try! decoder.decode([CodeWordCategory].self, from: data)
        }
        
        self.init(categoryObjects: categoryArray)
    }

    
    //MARK: - Methods
    
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
    
    func add(word newWord:String, forCategory category:String){
        
        for item in self.categoriesData{
            if item.categoryName == category{
                item.categoryWords.append(newWord)
            }
        }
        
        saveCategoryListToFile()
    }
    
    func remove(atIndex index: Int, forCategory category: String){
        for item in self.categoriesData{
            if item.categoryName == category{
                item.categoryWords.remove(at: index)
            }
        }
        
        saveCategoryListToFile()
    }
    
    func saveCategoryListToFile(){
        
        let fileName = "UserCategories"
        let DocumentDirURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        let fileURL = DocumentDirURL.appendingPathComponent(fileName).appendingPathExtension("plist")
        
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let data = try encoder.encode(self.categoriesData)
            try data.write(to: fileURL)
            
        } catch {
            print(error)
        }
        
    }
    
}

