//
//  ResponseCodableTests.swift
//  GBShopTests
//
//  Created by Irina Kuligina on 10.07.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class ResponseCodableTests: XCTestCase {
    struct PostStub: Codable {
        let userId: Int
        let id: Int
        let title: String
        let body: String
    }

    enum ApiErrorStub: Error {
        case fatalError
    }

    struct ErrorParserStub: AbstractErrorParser {
        func parse(_ result: Error) -> Error {
            return ApiErrorStub.fatalError
        }
        
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
            return error
        }
    }
    let expectation = XCTestExpectation(description: "https://jsonplaceholder.typicode.com/todos/1")
        var errorParser: ErrorParserStub!

        override func setUp() {
            super.setUp()
            errorParser = ErrorParserStub()
        }
        
        override func tearDown() {
            super.tearDown()
            errorParser = nil
        }
        
        func testShouldDownloadAndParse() {
           AF
                .request("https://jsonplaceholder.typicode.com/todos/1")
                .responseCodable(errorParser: errorParser) { [weak self] (response: AFDataResponse<PostStub>) in
                    switch response.result {
                    case .success(_): break
                    case .failure:
                        XCTFail()
                    }
                    self?.expectation.fulfill()
            }
            wait(for: [expectation], timeout: 10.0)
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

}
