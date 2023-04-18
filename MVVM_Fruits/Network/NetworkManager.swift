//
//  NetworkManager.swift
//  MVVM_Fruits
//
//  Created by mohomed Ali on 16/04/2023.
//

//
//  NetworkManager.swift
//  FruitTableAndCollection
//
//  Created by mohomed Ali on 11/04/2023.
//

import Foundation



class NetworkManager : Networkable_Protocol{
    
    var delegate: NetworkResponseProtocol?
    
    // MARK: - callAPIToGetData()
    // this delegate method sends data to View controller
    func callAPIToGetData(){
        
        let urlString = "https://fruityvice.com/api/fruit/all"
        guard let url = URL(string: urlString) else {return}
        
        // URLSession will manage network requests and the response and then used to create one of the tasks ie. dataTask/ uploadTask/ DownloadTask
        // this URLSession is a shared system session throughout our APP
        let session = URLSession.shared
        
        // on the session obj we are calling 1 method i.e dataTask
        // dataTask method trailing closure gives 3 values data, response & error we use this to handle different errors and response and make use of data
        
        
        let task = session.dataTask(with: url) { data, response, error in
            // erorr handle different scenario using guard let to transfer program control out of the scope when certain conditions are not met exit i.e handle that specific error
            // but if the condition don't fail the unwrapped value is accessible after the guard statement inside the scope of the func
            // handle the error
            if let error = error{
                print(error.localizedDescription)
                self.delegate?.didRecieveError(error: Error.self as! Error)
                return
            }
            
            // error handle if response HTTPURLResponse != 200 i.e good response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                print("Error for response")
                return
            }
            
            // another error handle if for some reason can't get hold of data
            guard let data = data else {
                print("couldn't get data from API")
                return
            }
            
            // now we have data do something
            do {
                // decode the JSON of the data with the struct THE DO needs a Catch
                let fruitsList = try JSONDecoder().decode([FruitStats].self, from: data)
                
//                self.fruitsListArr = fruitsList
                
//                print(fruitsList)
                
                // when want to do something related to UI on Main Thread need to use a Main Queue since you want to refresh the data  to reloadData i.e the rows and sections of the table view to fit on UI
                // ** need to access Main Thread along with async to do it otherwise you get Thread breakpoints
                
                // DispatchQueue - An object that manages the execution of tasks serially or concurrently on your app's main thread or on a background thread.
                // async - Schedules a block asynchronously for execution and optionally associates it with a dispatch group.
                
                // ** Need to use Delegate Protocol or clousre to return the data
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
                self.delegate?.didfinishWithResponseArray(array: fruitsList)
            } catch{
                print(error.localizedDescription)
            }
            
        }
        //need to trigger the API andthe whole block above with resume for task obj
        task.resume()
        
    }
    
    
    // MARK: - getDataFromAPIUsingClosur
    // this method using closure sends sends API data to TableViewModel
    func getDataFromAPIUsingClosure(urlString: String, completion: @escaping (Result<[FruitStats], Error>) -> Void ){
        
            guard let url = URL(string: urlString) else {return}
            

            let session = URLSession.shared
            

            
            let task = session.dataTask(with: url) { data, response, error in

                if let error = error{
                    print(error.localizedDescription)
                    completion(.failure(error))
                    return
                }
                

                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("Error for response")
                    return
                }
                
                // another error handle if for some reason can't get hold of data
                guard let data = data else {
                    print("couldn't get data from API")
                    return
                }
                

                do {

                    let fruitsList = try JSONDecoder().decode([FruitStats].self, from: data)
                    
                    completion(.success(fruitsList))
                } catch{
                    print(error.localizedDescription)
                }
                
            }
            //need to trigger the API andthe whole block above with resume for task obj
            task.resume()
            
        
        
    }
}
