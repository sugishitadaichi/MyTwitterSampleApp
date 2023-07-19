//
//  MyTwitterSampleAppTests.swift
//  MyTwitterSampleAppTests
//
//  Created by 杉下大智 on 2023/04/24.
//

import XCTest
@testable import MyTwitterSampleApp

final class MyTwitterSampleAppTests: XCTestCase, UITextViewDelegate {
    


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
//        evc = nil
    }
    
    func testTextViewShouldChangeTextIn() {
        // テスト用のUITextViewを作成し、Delegateを設定する
//        let textView = UITextView()
//        textView.delegate = evc
//
//        // 入力される文字と置換される範囲を指定し、戻り値が正しいかを検証する
//        XCTAssertTrue(evc.textView(textView, shouldChangeTextIn: NSRange(location: 0, length: 10), replacementText: "Hello"), "入力が許可されるべきでした")
//        XCTAssertTrue(evc.textView(textView, shouldChangeTextIn: NSRange(location: 0, length: 140), replacementText: "a"), "入力が許可されるべきでした")
//        XCTAssertFalse(evc.textView(textView, shouldChangeTextIn: NSRange(location: 0, length: 141), replacementText: "a"), "入力が制限されるべきでした")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        //EditorViewControllerクラスをインスタンス化
        let evc = EditorViewController()
        
        //140文字以上のテキスト
        let overText1 = "１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９"
        //140文字以下のテキスト
        let overText2 = "１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９１２３４５６７８９"
        

        //　テストコードを記述(140文字以上であればFalseを返す)
        XCTAssertFalse(evc.isTextWithinMaxLength(text: overText1))
        //　テストコードを記述(140文字以下であればTrueを返す)
        XCTAssertTrue(evc.isTextWithinMaxLength(text: overText2))
        
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
