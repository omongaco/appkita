//
//  KitaTestUITests.swift
//  KitaTestUITests
//
//  Created by Ansyar Hafid on 08/05/19.
//  Copyright © 2019 Ansyar Hafid. All rights reserved.
//

import XCTest

class KitaTestUITests: XCTestCase {
    var app: XCUIApplication!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.textFields["sum_x_field"].tap()
        app.textFields["sum_y_field"].tap()
        app.textFields["multiply_x_field"].tap()
        app.textFields["multiply_y_field"].tap()
        app.textFields["prime_field"].tap()
        app.textFields["fib_field"].tap()
        app.staticTexts["result_label"].tap()

        app.buttons["sum_button"].tap()
        app.buttons["multiply_button"].tap()
        app.buttons["prime_button"].tap()
        app.buttons["fibbonacci_button"].tap()
        
        
    }

}
