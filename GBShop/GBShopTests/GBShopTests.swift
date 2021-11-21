//
//  GBShopTests.swift
//  GBShopTests
//
//  Created by Irina Kuligina on 21.06.2021.
//

import XCTest
@testable import GBShop

class GBShopTests: XCTestCase {

    var requestFactory: RequestFactory?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        requestFactory = RequestFactory()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        requestFactory = nil
    }
    func testLogin () throws {
        
        
        let auth = try XCTUnwrap(requestFactory).makeAuthRequestFatory()
        
        let signIn = expectation(description: "log in")
        
        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                XCTAssertEqual(login.user.id, 123)
                print(login)
                signIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 10)
        
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

}
