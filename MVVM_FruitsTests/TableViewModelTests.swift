//
//  TableViewModelTests.swift
//  MVVM_FruitsTests
//
//  Created by mohomed Ali on 18/04/2023.
//

import XCTest
@testable import MVVM_Fruits

final class TableViewModelTests: XCTestCase {
    
    var table_ViewModel: TableViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // in the FakeNEtworkManager will read from JSON File
        table_ViewModel = TableViewModel(networkManager: FakeNetworkManager())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testgetDataUsingClosures_WithGoodInputs() throws {
        table_ViewModel.getDataUsingClosures(urlString: "")
//        tests value
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
