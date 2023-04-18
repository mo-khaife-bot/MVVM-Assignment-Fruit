//
//  TableViewModel.swift
//  MVVM_Fruits
//
//  Created by mohomed Ali on 17/04/2023.
//

import Foundation

// have option to get data using either closure or delegate

class TableViewModel{
    var networkManager :  Networkable_Protocol
    var fruits_List = [FruitStats]()
    
    // need this closure to capture the reload table func as can only be used in Table VC as uses TableView parameter directly
    var reloadMyView: (() -> Void )?
    
    /**
     The dataManager dependency is injected via the init method. This way, the class is not tightly coupled to a specific implementation of the data manager and can easily be tested with a mock data manager conforming to the same protocol.

     Overall, dependency injection is a powerful technique for writing maintainable, flexible, and testable code in Swift.
     
     */
    // MARK: - Constructor Injection
    init(networkManager: Networkable_Protocol) {
        self.networkManager = networkManager

    }
    
    // MARK: - getDataUsingClosures()
    // fetch the data using closure
    func getDataUsingClosures(urlString: String) {

        // function injection here                           
        self.networkManager.getDataFromAPIUsingClosure(urlString: urlString) {result in
            switch result{
            case .success(let fruits):
                self.fruits_List = fruits
                self.reloadMyView?()
                print("called API using CLOSURE \(fruits[0].name)")

            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }
    
    // MARK: - getDataUsingProtocolDelegate()
    // fetch the data using protocol
//    func getDataUsingProtocolDelegate() {
//        self.networkManager.delegate = self
//        self.networkManager.callAPIToGetData()
//    }
}

// *** use protocol to call the API and moved into
extension TableViewModel: NetworkResponseProtocol{
    
        func didfinishWithResponseArray(array: [FruitStats]) {
            // assign to local obj
            self.fruits_List = array
            self.reloadMyView?()
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
            print("called API using DELEGATE \(array[0].name)")
        }
    
        func didRecieveError(error: Error) {
            print(error)
        }
    
}


/**
 Dependency Injection: instead of locally hard coding URL string or Network Manager we will pass it from outside
 
 injecting dependencies (i.e., objects or services that a class needs to function) into a class rather than having the class create or manage them directly. This allows for greater decoupling and flexibility, as the class can be easily tested or modified without affecting its dependencies.
 
 1. Constructor Injection: the dependencies are passed to a class through its constructor. The dependencies are usually stored as instance variables in the class and used throughout its methods.
 
 2. Property Injection: the dependencies are set as properties of the class after it is created.
 
 
 3. Function/Method Injection:  the dependencies are passed as arguments to the methods that need them. This type of injection is useful when a class needs a dependency only for a specific method and not for the entire lifespan of the class.
 
 */

