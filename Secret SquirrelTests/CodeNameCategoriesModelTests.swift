//
//  CodeNameCategoriesModelTests.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 5/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import XCTest

class CodeNameCategoriesModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDesignatedInitialiser(){
        let testCodeWordCategory = CodeWordCategory.init(categoryName: "My Category", categoryDesc: "My Desc", categoryWords: ["Cats", "Jewels", "Metals"])
        let testCodeWordCategories = CodeWordCategories.init(categoryObjects: [testCodeWordCategory])
        
        XCTAssert(testCodeWordCategories.categoriesData.count > 0)
    }
    
    func testConvenienceInitialiser(){
        let testCodeWordCategories=CodeWordCategories.init()
        XCTAssertNotNil(testCodeWordCategories.categoriesData)
        XCTAssert(testCodeWordCategories.categoriesData.count > 0)
    }
    
    func testArrayofWords(){
        let testCodeWordCategories=CodeWordCategories.init()
        XCTAssert(testCodeWordCategories.arrayOfWords(forCategory: "Metals").count == 22)
        XCTAssert(testCodeWordCategories.arrayOfWords(forCategory: "Test") == [])
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            //Test speed of plist read here.
            // Put the code you want to measure the time of here.
        }
    }
    
}
