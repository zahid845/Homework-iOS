//
//  Homework_iOSTests.swift
//  Homework-iOSTests
//
//  Created by Admin on 5/8/21.
//

import XCTest
@testable import Homework_iOS

class Homework_iOSTests: XCTestCase {

    var urlSesion: URLSession!

    
    override func setUp() {
        super.setUp()
        urlSesion = URLSession(configuration: .default)
    }

    override func tearDown() {
        urlSesion = nil
        super.tearDown()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    
    func testValidCallToJSONPlaceholer() {
           // given
           let url = URL(string: urlToApi)

           //expected
           let promise = expectation(description: "Status code: 200 or 201")

           // when
           let dataTask = urlSesion.dataTask(with: url!) { data, response, error in

               // then
               if let error = error {
                   XCTFail("Error: \(error.localizedDescription)")
                   return
               } else if let statusCode = (response as? HTTPURLResponse)?.statusCode {

                   if statusCode == 200 || statusCode == 201 {
                       promise.fulfill()
                   } else {
                       XCTFail("Status code: \(statusCode)")
                   }
               }
           }
           dataTask.resume()

           //Keeps the test running until all expectations are fulfilled, or the timeout interval ends, whichever happens first
           wait(for: [promise], timeout: 5)
       }
}
