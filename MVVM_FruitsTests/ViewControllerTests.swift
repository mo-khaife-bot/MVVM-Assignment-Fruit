//
//  ViewControllerTests.swift
//  MVVM_FruitsTests
//
//  Created by mohomed Ali on 17/04/2023.
//

import XCTest
@testable import MVVM_Fruits

final class ViewControllerTests: XCTestCase {
    
    var view_Controller: ViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("setIpWithError")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        view_Controller = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        // view Hierarchy has been set here alternative to reload() and allowes u to access outlets on ViewController
        _ = view_Controller.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        print("tearDownWithError")
        view_Controller = nil
    }
    
//    func testDoValidLogin(){
//        view_Controller.emailTextFld.text = "abc@xyz.com"
//        view_Controller.passwordTextFld.text = "1234567"
//        let result = view_Controller.doValidLogin()
//        XCTAssertTrue(result)
//    }
//    
//    func testDoValidLoginWithInvalidEmail(){
//        view_Controller.emailTextFld.text = "abcxyz.com"
//        view_Controller.passwordTextFld.text = "1234567"
//        let result = view_Controller.doValidLogin()
//        XCTAssertFalse(result)
//    }
//    
//    func testDoValidLoginWithEmptyEmail(){
//        view_Controller.emailTextFld.text = ""
//        view_Controller.passwordTextFld.text = "1234567"
//        let result = view_Controller.doValidLogin()
//        XCTAssertFalse(result)
//    }
//    
//    func testDoValidLogin_With_Password_MinimumLength_shouldPass(){
//        view_Controller.emailTextFld.text = "abc@xyz.com"
//        view_Controller.passwordTextFld.text = "1234567"
//        let result = view_Controller.doValidLogin()
//        XCTAssertTrue(result)
//        
//        XCTAssertEqual(7, Int(view_Controller.passwordTextFld.text?.count ?? 0))
//    }
//    
//    func testDoValidLogin_With_Password_MinimumLength_shouldNotPass(){
//        view_Controller.emailTextFld.text = "abc@xyz.com"
//        view_Controller.passwordTextFld.text = "12"
//        let result = view_Controller.doValidLogin()
//        XCTAssertFalse(result)
//        
//        XCTAssertGreaterThanOrEqual(6, Int(view_Controller.passwordTextFld.text?.count ?? 0))
//    }

    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
