//
//  ModelTests.swift
//  Secret Squirrel
//
//  Created by Jason van Lint on 5/7/17.
//  Copyright © 2017 Dead Frog Studios. All rights reserved.
//

import XCTest
@testable import Secret_Squirrel

class CodeNameModelTests: XCTestCase {

    var codeNameTest: CodeName!
    
    override func setUp() {
        
        super.setUp()
        codeNameTest = CodeName()
    }
    
    override func tearDown() {
        
        codeNameTest = nil
        super.tearDown()
        
    }
    
    func testDesignatedInitialiser(){
        let testCodeName = CodeName.init(prefix: "Test", middle: "Middle", suffix: "Suffix")
        
        XCTAssertTrue(testCodeName.prefix == "Test")
        XCTAssertTrue(testCodeName.middle == "Middle")
        XCTAssertTrue(testCodeName.suffix == "Suffix")
    }
    
    func testCodeNamePropertyCalculation(){
        let testCodeName = CodeName.init(prefix: "Test", middle: "Middle", suffix: "Suffix")
        XCTAssert(testCodeName.codeNameString == "Test Middle Suffix")
        
        let testMissingSuffix = CodeName.init(prefix: "Test", middle: "Middle", suffix: "")
        XCTAssert(testMissingSuffix.codeNameString == "Test Middle")
        
        let testMissingMiddle = CodeName.init(prefix: "Test", middle: "", suffix: "Middle")
        XCTAssert(testMissingMiddle.codeNameString == "Test Middle")
        
        let testMissingPrefix = CodeName.init(prefix: "", middle: "Test", suffix: "Middle")
        XCTAssert(testMissingPrefix.codeNameString == "Test Middle")
    }
    
    func testConvenienceInitialiser(){
        XCTAssertNotNil(codeNameTest.prefix)
        XCTAssertNotNil(codeNameTest.middle)
        XCTAssertNotNil(codeNameTest.suffix)
    }
}
