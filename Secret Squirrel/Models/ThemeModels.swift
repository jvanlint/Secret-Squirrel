//
//  ThemeModels.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 30/9/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import Foundation

class Theme: Codable{
    
    var name: String
    var description: String
    var type: String
    var prefix: String
    var middle: String
    var suffix: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "themeName"
        case description = "themeDescription"
        case type = "themeType"
        case prefix = "prefix"
        case middle = "middle"
        case suffix = "suffix"
    }
    
    // MARK: - Initializers
    
    // Designated initializer
    init(name: String, description: String, type: String, prefix: String, middle: String, suffix: String) {
        self.name = name
        self.description = description
        self.type = type
        self.prefix = prefix
        self.middle = middle
        self.suffix = suffix
    }
}

class Themes: Decodable{
    var themesList: [Theme]
    
    // Designated initialiser
    init(themesList: [Theme]){
        
        self.themesList = themesList
    }
    
    // Convenience initialiser
    convenience init(){
        var themesArray: [Theme] = []
        
        let fileURL = Bundle.main.url(forResource: "Themes", withExtension: "plist")!
        
        if let data = try? Data(contentsOf: fileURL) {
            let decoder = PropertyListDecoder()
            themesArray = try! decoder.decode([Theme].self, from: data)
        }
        
        self.init(themesList:themesArray)
    }
}
