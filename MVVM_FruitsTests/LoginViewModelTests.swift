//
//  LoginViewModelTests.swift
//  MVVM_FruitsTests
//
//  Created by mohomed Ali on 17/04/2023.
//

import XCTest
@testable import MVVM_Fruits


final class LoginViewModelTests: XCTestCase {
    
    var login_viewModel: LoginViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        login_viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        login_viewModel = nil
    }
    
    func testDoValidLogin(){
        let result = login_viewModel.doValidLogin(emailID: "abc@xyc.com", passwordId: "dsjbsadjb2")
        XCTAssertTrue(result)
    }
    
    func testDoValidLoginWithInvalidEmail(){
//        view_Controller.emailTextFld.text = "abcxyz.com"
//        view_Controller.passwordTextFld.text = "1234567"
        let result = login_viewModel.doValidLogin(emailID: "abcxyz.com", passwordId: "1234567")
        XCTAssertFalse(result)
    }
    
    func testDoValidLoginWithEmptyEmail(){
        let result = login_viewModel.doValidLogin(emailID: "", passwordId: "1234567")
        XCTAssertFalse(result)
    }
    
    func testDoValidLogin_With_Password_MinimumLength_shouldPass(){
        let result = login_viewModel.doValidLogin(emailID: "abc@xyz.com", passwordId: "1234567")
        XCTAssertTrue(result)
        
//        XCTAssertEqual(7, Int(view_Controller.passwordTextFld.text?.count ?? 0))
    }
    
    func testDoValidLogin_With_Password_MinimumLength_shouldNotPass(){
        let result = login_viewModel.doValidLogin(emailID: "abc@xyz.com", passwordId: "12")
        XCTAssertFalse(result)
        
//        XCTAssertGreaterThanOrEqual(6, Int(view_Controller.passwordTextFld.text?.count ?? 0))
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

}
