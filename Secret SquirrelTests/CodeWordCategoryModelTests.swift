//
//  CodeWordCategoryModelTests.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 5/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import XCTest

class CodeWordCategoryModelTests: XCTestCase {
    
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
        XCTAssert(testCodeWordCategory.categoryName == "My Category")
        XCTAssert(testCodeWordCategory.categoryDesc == "My Desc")
        XCTAssert(testCodeWordCategory.categoryWords == ["Cats", "Jewels", "Metals"])
    }
    
    
}
