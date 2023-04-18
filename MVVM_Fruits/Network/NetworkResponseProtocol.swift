//
//  NetworkResponseProtocol.swift
//  MVVM_Fruits
//
//  Created by mohomed Ali on 16/04/2023.
//

import Foundation

protocol NetworkResponseProtocol{
    func didfinishWithResponseArray(array: [FruitStats])
    func didRecieveError(error: Error)
}
