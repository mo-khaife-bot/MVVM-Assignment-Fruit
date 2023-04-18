//
//  TableViewController.swift
//  MVVM_Fruits
//
//  Created by mohomed Ali on 16/04/2023.
//

import UIKit

class TableViewController: UIViewController {
    
    let urlString = "https://fruityvice.com/api/fruit/all"
    
    // MARK: - Properties
    @IBOutlet weak var tableView: UITableView!
    
    // creating an instance of the struct that is the skeleton of our data from the API
    // get rid of this when using Closure and moving API call to our view model
//    var fruitsListArr = [FruitStats]()
    
    // create new obj dpenedency of networkManager and feed it into your TableViewModel
    let table_ViewModel = TableViewModel(networkManager: NetworkManager())
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        tableView.delegate = self
        tableView.dataSource = self
        
        
        tableView.separatorStyle = .none
        
        // call API func on load when using protocol Delegate for the API
//        let networkManager = NetworkManager()
//        networkManager.delegate = self
//        networkManager.callAPIToGetData()
        
        // ** method when using closure to reload TableView
        table_ViewModel.reloadMyView = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        // calling API with CLOSURE
        table_ViewModel.getDataUsingClosures(urlString: urlString)
        
        // call this func to call API using DELEGATE
//        table_ViewModel.getDataUsingProtocolDelegate()
    }
    
//    func getDataUsingClosures() {
//        networkManager.getDataFromAPIUsingClosure {result in
//            switch result{
//            case .success(let fruits):
//                self.fruitsListArr = fruits
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//            
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSource

extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return table_ViewModel.fruits_List.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell") as! FruitsTVC
        cell.fruitsLbl.text = table_ViewModel.fruits_List[indexPath.row].name.capitalized
        
        cell.fruitsView.layer.cornerRadius = cell.fruitsView.frame.height / 2
        
        return cell
    }
    
    
}


// MARK: -UITableViewDelegate

//extension TableViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        performSegue(withIdentifier: "showDetails", sender: self)
//    }
//
//}
//
//// func to pass the data
//override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//    if let destination = segue.destination as? DetailsViewController{
//
//        destination.fruits = fruitsListArr[(tableView.indexPathForSelectedRow?.row)!]
//    }
//}


// MARK: - NetworkResponseProtocol
// *** Adopt our protocol like how we did for Sytem protocols for TV
//extension TableViewController: NetworkResponseProtocol {
//    func didfinishWithResponseArray(array: [FruitStats]) {
//        // assign to local obj
//        self.fruitsListArr = array
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//        print("called API using Delegate \(array[0].name)")
//    }
//
//    func didRecieveError(error: Error) {
//        print(error)
//    }
//
//}


