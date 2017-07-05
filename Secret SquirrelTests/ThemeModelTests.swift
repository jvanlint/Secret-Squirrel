//
//  ThemeModelTests.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 6/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import XCTest
@testable import Secret_Squirrel

class ThemeModelTests: XCTestCase {
    
    var themeModelObject: Theme!
    
    override func setUp() {
        super.setUp()
        themeModelObject = Theme(name: "Test", description: "Test Desc", type: "User", categories: ("Cat", "Dog","Bird"))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        themeModelObject = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDesignatedInitialisation() {
        XCTAssert(themeModelObject.name == "Test", "Themen name failed to initialise")
        XCTAssert(themeModelObject.description == "Test Desc", "Theme desc failed to initialise")
        XCTAssert(themeModelObject.type == "User", "Theme type failed to initialise")
        XCTAssert(themeModelObject.categories == ("Cat", "Dog", "Bird"), "Theme categories failed to initialise")
    }
}
