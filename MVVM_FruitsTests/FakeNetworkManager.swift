//
//  FakeNetworkManager.swift
//  MVVM_FruitsTests
//
//  Created by mohomed Ali on 18/04/2023.
//

import Foundation
@testable import MVVM_Fruits

/**
 https://medium.com/@danmarcenco/mockable-networking-layer-in-ios-4b2361339630
 Mockable Networking layer in iOS
 */

// subclassing FakeNetworkManager to NetworkManager will create more problems
class FakeNetworkManager : Networkable_Protocol{
    
    func getDataFromAPIUsingClosure(urlString: String, completion: @escaping (Result<[FruitStats], Error>) -> Void) {
        print("Before API")
        // take a bundle where FakeNetworkManager file is present i.e the folder its in i.e MVVM_FruitsTests Bundle
        let bundle = Bundle(for: FakeNetworkManager.self)
        
        // give me this file of type json from this bundle
        let url = bundle.url(forResource: "FruitFileTest", withExtension: "json")
        guard let url = url else {return}
        do {
            
            // read the data from that json file and get me data in terms of bytes
            let data = try Data(contentsOf: url)
            // convert those bytes into a json model of type FruitStats struct to get list of fruits
            let fruitsList = try JSONDecoder().decode([FruitStats].self, from: data)
            print(fruitsList)
            
            completion(.success(fruitsList))
        } catch{
            completion(.failure(error))
            print(error.localizedDescription)
        }
        
        print("End of function API")
    }
    
}
