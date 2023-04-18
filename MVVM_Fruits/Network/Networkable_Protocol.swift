//
//  Networkable_Protocol.swift
//  MVVM_Fruits
//
//  Created by mohomed Ali on 18/04/2023.
//

import Foundation

protocol Networkable_Protocol {
    func getDataFromAPIUsingClosure(urlString: String, completion: @escaping (Result<[FruitStats], Error>) -> Void)
}
