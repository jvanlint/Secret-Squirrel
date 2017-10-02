//
//  ThemesModelTests.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 6/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import XCTest
@testable import Secret_Squirrel

class ThemesModelTests: XCTestCase {
    
    var themesObject: Themes!
    
    override func setUp() {
        super.setUp()
        themesObject=Themes()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        themesObject = nil
        super.tearDown()
    }
    
    func testDesignatedInitialiser() {
        let testThemeObject = Theme(name: "Test", description: "Test", type: "Test", prefix: "Test", middle: "Test", suffix: "Test")
        let testThemesObject = Themes(themesList: [testThemeObject])
        
        XCTAssert(testThemesObject.themesList.count > 0, "Themes object did not initialise theme list correctly.")
    }
    
    func testConvenienceInitialiser(){
        XCTAssertNotNil(themesObject.themesList)
        XCTAssert(themesObject.themesList.count > 0, "Array of Themes not initialised.")
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
           let _ = Themes.init()
        }
    }
    
}
