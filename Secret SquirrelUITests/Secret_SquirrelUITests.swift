//
//  Secret_SquirrelUITests.swift
//  Secret SquirrelUITests
//
//  Created by Jason van Lint on 29/6/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import XCTest

class Secret_SquirrelUITests: XCTestCase {
    
    var app: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCUIDevice.shared().orientation = .portrait
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        let secretSquirrelNavigationBar = app.navigationBars["Secret Squirrel"]
        snapshot("01LandingScreen")
        secretSquirrelNavigationBar.buttons["SettingsIcon"].tap()
        snapshot("02SettingsScreen")
        app.otherElements.containing(.navigationBar, identifier:"Customise").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button).matching(identifier: "Edit").element(boundBy: 1).tap()
        snapshot("03CategoriesScreen")
        app.navigationBars["Category"].buttons["Customise"].tap()
        app.navigationBars["Customise"].buttons["Secret Squirrel"].tap()
        secretSquirrelNavigationBar.buttons["MsgIcon"].tap()
        snapshot("04MessageScreen")
        app.sheets.buttons["Cancel"].tap()
        
        
        
        
        
    }
    
}
