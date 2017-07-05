//
//  ModelTests.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 5/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import XCTest
@testable import Secret_Squirrel

class ModelTests: XCTestCase {

    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCodeNameModel(){
        let testCodeName = CodeName.init(prefix: "Test", middle: "Middle", suffix: "Suffix")
        XCTAssertTrue(testCodeName.prefix=="Test")
        XCTAssertTrue(testCodeName.middle=="Middle")
        XCTAssertTrue(testCodeName.suffix=="Suffix")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
