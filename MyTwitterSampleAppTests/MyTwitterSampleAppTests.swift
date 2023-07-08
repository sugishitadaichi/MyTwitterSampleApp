//
//  MyTwitterSampleAppTests.swift
//  MyTwitterSampleAppTests
//
//  Created by 杉下大智 on 2023/04/24.
//

import XCTest
@testable import MyTwitterSampleApp

final class MyTwitterSampleAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    //　ViewController用テスト実装
    func testVCOutput() throws {
        let vc = ViewController()
        let number = vc.vcOutput(number: 22)
        XCTAssertEqual(22, number)
    }
    
    //　EditorViewController用テスト実装(number2=文字数制限のテストコード)
    func testEVCOutput() throws {
        let evc = EditorViewController()
        let number1 = evc.evcOutput(number: 22)
        let number2 = evc.exEVCOutput(number: 23)
        XCTAssertEqual(22, number1)
        XCTAssertEqual(23, number2)
    }
    
    //　MainTableViewCell用のテスト実装
    func testMTVCOutput() throws {
        let mtvc = MainTableViewCell()
        let number = mtvc.mtvcOutput(number: 22)
        XCTAssertEqual(22, number)
    }
    //　Tweet用のテスト実装
    func testTweetOutput() throws {
        let tweet = Tweet()
        let number = tweet.tweetOutput(number: 22)
        XCTAssertEqual(22, number)
    }

}
