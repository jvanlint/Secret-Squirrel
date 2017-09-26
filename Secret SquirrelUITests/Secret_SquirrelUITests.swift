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
        
        XCUIDevice.shared.orientation = .portrait
        XCUIDevice.shared.orientation = .portrait
        
        //let app = XCUIApplication()
//        snapshot("01-LandingScreen")
//        app.navigationBars["Secret Squirrel"].buttons["SettingsIcon"].tap()
//        snapshot("02-SettingsScreen")
//
//        let tablesQuery = app.tables
//        tablesQuery.staticTexts["Customise Code Name Categories"].tap()
//        snapshot("03-CategoryScreen")
//        app.otherElements.containing(.navigationBar, identifier:"Customise").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 2).buttons["Edit"].tap()
//        snapshot("04-SelectCategoryScreen")
//        app.navigationBars["Category"].buttons["Customise"].tap()
//        app.navigationBars["Customise"].buttons["Settings"].tap()
//        tablesQuery.staticTexts["Select a Theme"].tap()
//        snapshot("05-ThemeScreen")
//        app.navigationBars["Themes"].buttons["Settings"].tap()
//        tablesQuery.staticTexts["About Secret Squirrel"].tap()
        
        
        let app = XCUIApplication()
        snapshot("01-LandingScreen")
        app.navigationBars["Secret Squirrel"].children(matching: .button).element(boundBy: 0).tap()
        snapshot("02-SettingsScreen")
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Select a Theme"]/*[[".cells.staticTexts[\"Select a Theme\"]",".staticTexts[\"Select a Theme\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("03-ThemesScreen")
        app.navigationBars.buttons["Settings"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Customise Code Name Categories"]/*[[".cells.staticTexts[\"Customise Code Name Categories\"]",".staticTexts[\"Customise Code Name Categories\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        snapshot("04-CustomiseScreen")
        
        
                
        
        
    }
    
}
