//
//  CodeNameCategoriesModelTests.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 5/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import XCTest

class CodeNameCategoriesModelTests: XCTestCase {
    
    var CodeWordCategoriesObject: CodeWordCategories!
    
    override func setUp() {
        super.setUp()
        CodeWordCategoriesObject=CodeWordCategories()
    }
    
    override func tearDown() {
        CodeWordCategoriesObject = nil
        super.tearDown()
    }
    
    func testDesignatedInitialiser(){
        let testCodeWordCategory = CodeWordCategory.init(categoryName: "My Category", categoryDesc: "My Desc", categoryWords: ["Cats", "Jewels", "Metals"])
        let testCodeWordCategories = CodeWordCategories.init(categoryObjects: [testCodeWordCategory])
        
        XCTAssert(testCodeWordCategories.categoriesData.count > 0, "Categories initialiser failed.")
    }
    
    func testConvenienceInitialiser(){
        XCTAssertNotNil(CodeWordCategoriesObject.categoriesData)
        XCTAssert(CodeWordCategoriesObject.categoriesData.count > 0, "Array of Categories not initialised.")
    }
    
    func testArrayOfWordsForCategory(){
        XCTAssert(CodeWordCategoriesObject.arrayOfWords(forCategory: "Metals").count == 22, "Count of Metals category not correct.")
        XCTAssert(CodeWordCategoriesObject.arrayOfWords(forCategory: "Test") == [], "Array not empty for unspecified Category.")
    }

    func testArrayOfAllCategories(){
        XCTAssert(CodeWordCategoriesObject.arrayOfAllCategories().count > 0, "Array of all categories empty.")
    }
    
    func testRandomWordFromCategory(){
        XCTAssertNotNil(CodeWordCategoriesObject.randomWord(fromCategory: "Metals"), "Random Word returned nil.")
        XCTAssertNotNil(CodeWordCategoriesObject.randomWord(fromCategory: "Test"), "Random Word for unknown category returned nil.")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            //Test speed of plist read here.
            // Put the code you want to measure the time of here.
            let speedTest = CodeWordCategories.init()
            _ = speedTest.randomWord(fromCategory: "Metals")
        }
    }
    
}
