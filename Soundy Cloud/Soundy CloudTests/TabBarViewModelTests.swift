//
//  TabBarViewModelTests.swift
//  Soundy CloudTests
//
//  Created by Igor on 07/08/2017.
//  Copyright © 2017 DrimTim. All rights reserved.
//

import XCTest
@testable import Soundy_Cloud

extension UIViewController : TabCompatible { }
class TabBarViewModelTests: XCTestCase {
  
    override func setUp() {
        super.setUp()
      
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
      // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
  
  func testInit() {
    let controller: TabCompatible = UIViewController()
    let tabTypes: [TabType] = [.list, .favorites, .player, .profile]
    let model = TabBarViewModel(tabController: controller, types: tabTypes)
    XCTAssert(model.tabItems.count == tabTypes.count, "Incorrecr number of tabs")
    
  }
    func testExample() {
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
