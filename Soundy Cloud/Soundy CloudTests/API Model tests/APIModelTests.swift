//
//  APIModelTests.swift
//  Soundy CloudTests
//
//  Created by Igor on 15/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import XCTest
@testable import Soundy_Cloud


class APIModelTests: XCTestCase {
  
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTrackParsing() {
      let testBundle = Bundle(for: type(of: self))
      guard let sampleDataPath = testBundle.path(forResource: "Track", ofType: "json") else {
        XCTAssert(false, "Sample file not found")
        return
      }
      do {
        let jsonString = try String(contentsOfFile: sampleDataPath)
        let track = try Track(JSONString: jsonString)
      } catch {
        XCTAssert(false, "Sample file not loaded")
      }
      // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
