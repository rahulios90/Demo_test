//
//  ProductListUITests.swift
//  SampleBayutUITests
//
//  Created by OfficeUser on 30/11/21.
//

import XCTest

@testable import SampleBayut

class ProductListViewControllerTests: XCTestCase {
    private let tableViewIdentifier = "productList"

    var app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments = ["-uitesting"]
    }
    
    func testProductListNormal() {
        app.launch()
        assertTableViewResult()
    }
    
    func testProductListEmpty() {
        
        /// Need 3rd party libarary
        
        app.launch()
        XCTAssert(app.staticTexts["Nothing new 🙃"].waitForExistence(timeout: 15))
    }
    
    func testListCellTap() {
        app.launch()
        
        XCTAssert(app.tables[tableViewIdentifier].waitForExistence(timeout: 15))
        app.tables[tableViewIdentifier].cells.firstMatch.tap()
        RunLoop.current.run(until: Date())
           
        app.navigationBars["Product Detail"].exists
        }
    
    private func assertTableViewResult() {
        XCTContext.runActivity(named: "Test Successful TableView Screen") { _ in
            XCTAssert(app.tables[tableViewIdentifier].waitForExistence(timeout: 15))
            XCTAssert(app.tables[tableViewIdentifier].cells.count > 0)
        }
    }
}
